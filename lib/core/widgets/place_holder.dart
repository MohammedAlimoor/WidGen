// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:wid_gen/wid_gen.dart';

class RPSCustomPainter extends CustomPainter {
  // final Path originalPath;
  final Color pathColor;
  final double strokeWidth;
  final double dashGapLength;
  final double dashLength;
  late DashedPathProperties _dashedPathProperties;
  final String title;
  RPSCustomPainter({
    // required this.originalPath,
    required this.pathColor,
    this.strokeWidth = 3.0,
    this.dashGapLength = 5.0,
    this.dashLength = 10.0,
    this.title = "Drag item here",
  });

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.restore();
    // var rct = Rect.fromLTWH(size.width * 0.02749990, size.height * 0.09333327,
    var pp = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    _dashedPathProperties = DashedPathProperties(
      path: Path(),
      dashLength: dashLength,
      dashGapLength: dashGapLength,
    );
    final dashedPath = _getDashedPath(pp, dashLength, dashGapLength);
    canvas.drawPath(
      dashedPath,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = pathColor
        ..strokeWidth = strokeWidth,
    );

    final textStyle = TextStyle(
      color: pathColor,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: title,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final xCenter = (size.width - textPainter.width) / 2;
    final yCenter = (size.height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(RPSCustomPainter oldDelegate) => false;

  Path _getDashedPath(
    Path originalPath,
    double dashLength,
    double dashGapLength,
  ) {
    final metricsIterator = originalPath.computeMetrics().iterator;
    while (metricsIterator.moveNext()) {
      final metric = metricsIterator.current;
      _dashedPathProperties.extractedPathLength = 0.0;
      while (_dashedPathProperties.extractedPathLength < metric.length) {
        if (_dashedPathProperties.addDashNext) {
          _dashedPathProperties.addDash(metric, dashLength);
        } else {
          _dashedPathProperties.addDashGap(metric, dashGapLength);
        }
      }
    }
    return _dashedPathProperties.path;
  }
}

class DragPlaceholder extends WidGen {
  DragPlaceholder(
      {Key? key,
      keyID = "DragPlaceholder",
      this.color = const Color(0xFF455A64), // Blue Grey 700
      this.strokeWidth = 2.0,
      this.fallbackWidth = 400.0,
      this.fallbackHeight = 400.0,
      this.title = "Drag item here",
      this.child})
      : super(key: key, keyID: keyID);

  @override
  String? get json => "";
  @override
  String? get name => "Column";

  @override
  Widget get widgetProperties => Container();
  final Color color;
  final String title;

  /// The width of the lines in the placeholder box.
  final double strokeWidth;

  /// The width to use when the placeholder is in a situation with an unbounded
  /// width.
  ///
  /// See also:
  ///
  ///  * [fallbackHeight], the same but vertically.
  final double fallbackWidth;

  /// The height to use when the placeholder is in a situation with an unbounded
  /// height.
  ///
  /// See also:
  ///
  ///  * [fallbackWidth], the same but horizontally.
  final double fallbackHeight;

  /// The [child] contained by the placeholder box.
  ///
  /// Defaults to null.
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: fallbackWidth,
      maxHeight: fallbackHeight,
      child: CustomPaint(
        size: Size.infinite,
        painter: RPSCustomPainter(pathColor: color, title: title
            // color: color,
            // strokeWidth: strokeWidth,
            ),
        child: child,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ColorProperty('color', color, defaultValue: const Color(0xFF455A64)));
    properties
        .add(DoubleProperty('strokeWidth', strokeWidth, defaultValue: 2.0));
    properties.add(
        DoubleProperty('fallbackWidth', fallbackWidth, defaultValue: 400.0));
    properties.add(
        DoubleProperty('fallbackHeight', fallbackHeight, defaultValue: 400.0));
    properties
        .add(DiagnosticsProperty<Widget>('child', child, defaultValue: null));
  }
}

class DashedPathProperties {
  double extractedPathLength;
  Path path;

  final double _dashLength;
  double _remainingDashLength;
  double _remainingDashGapLength;
  bool _previousWasDash;

  DashedPathProperties({
    required this.path,
    required double dashLength,
    required double dashGapLength,
  })  : assert(dashLength > 0.0, 'dashLength must be > 0.0'),
        assert(dashGapLength > 0.0, 'dashGapLength must be > 0.0'),
        _dashLength = dashLength,
        _remainingDashLength = dashLength,
        _remainingDashGapLength = dashGapLength,
        _previousWasDash = false,
        extractedPathLength = 0.0;

  bool get addDashNext {
    if (!_previousWasDash || _remainingDashLength != _dashLength) {
      return true;
    }
    return false;
  }

  void addDash(ui.PathMetric metric, double dashLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashLength);
    final availableEnd = _calculateLength(metric, dashLength);
    // Add path
    final pathSegment = metric.extractPath(extractedPathLength, end);
    path.addPath(pathSegment, Offset.zero);
    // Update
    final delta = _remainingDashLength - (end - extractedPathLength);
    _remainingDashLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashLength,
    );
    extractedPathLength = end;
    _previousWasDash = true;
  }

  void addDashGap(ui.PathMetric metric, double dashGapLength) {
    // Calculate lengths (actual + available)
    final end = _calculateLength(metric, _remainingDashGapLength);
    final availableEnd = _calculateLength(metric, dashGapLength);
    // Move path's end point
    ui.Tangent tangent = metric.getTangentForOffset(end)!;
    path.moveTo(tangent.position.dx, tangent.position.dy);
    // Update
    final delta = end - extractedPathLength;
    _remainingDashGapLength = _updateRemainingLength(
      delta: delta,
      end: end,
      availableEnd: availableEnd,
      initialLength: dashGapLength,
    );
    extractedPathLength = end;
    _previousWasDash = false;
  }

  double _calculateLength(ui.PathMetric metric, double addedLength) {
    return math.min(extractedPathLength + addedLength, metric.length);
  }

  double _updateRemainingLength({
    required double delta,
    required double end,
    required double availableEnd,
    required double initialLength,
  }) {
    return (delta > 0 && availableEnd == end) ? delta : initialLength;
  }
}
