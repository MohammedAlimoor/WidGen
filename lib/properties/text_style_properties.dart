// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap_widgets/bootstrap_widgets.dart';
import 'package:get/get.dart';
import 'package:wid_gen/core/google_fonts_list.dart';
import 'package:wid_gen/core/mac_alert_dialog.dart';

class TextStyleProperties extends StatefulWidget {
  TextStyleProperties(
      {Key? key,
      required this.onSubmitted,
      required this.onSubmittedEnableGoogleFonts,
      this.textStyle,
      this.enableGoogleFonts = true})
      : super(key: key);

  Function(TextStyle)? onSubmitted;
  Function(bool)? onSubmittedEnableGoogleFonts;
  final TextStyle? textStyle;
  bool enableGoogleFonts;

  @override
  State<TextStyleProperties> createState() => _TextStylePropertiesState();
}

class _TextStylePropertiesState extends State<TextStyleProperties> {
  // List<TextStyle> styles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BootstrapPanel(
        header: const SelectableText('Google Fonts'),
        body: Column(
          children: [
            CheckboxListTile(
                title: const Text("Enable"),
                contentPadding: EdgeInsets.zero,
                value: widget.enableGoogleFonts,
                onChanged: (enable) {
                  setState(() {
                    widget.enableGoogleFonts = enable ?? false;
                  });

                  widget.onSubmittedEnableGoogleFonts
                      ?.call(widget.enableGoogleFonts);
                }),
            const SizedBox(height: 10),
            if (widget.textStyle != null)
              Row(
                children: [
                  const Text("Font Family:"),
                  Expanded(
                    child: BootstrapLabel(
                      text: widget.textStyle!.fontFamily ?? " - ",
                      // type: BootstrapLabelType.info,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            if (widget.enableGoogleFonts)
              Row(
                children: [
                  Expanded(
                    child: BootstrapButton(
                      type: BootstrapButtonType.primary,
                      size: BootstrapButtonSize.defaults,
                      child: const Text('Select Font'),
                      outline: true,
                      onPressed: () {
                        showFontsPicker();
                      },
                    ),
                  ),
                ],
              ),
          ],
        ));
  }

  showFontsPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MacAlertDialog(
            title: const Text('Select Fonts'),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Get.back(),
              ),
            ],
            content: GoogleFontListView(
              onSubmitted: (stl) {
                widget.onSubmitted?.call(stl);
                Get.back();
              },
            ));
      },
    );
  }
}
