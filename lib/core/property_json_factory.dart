import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';

class PropertyJsonFactory {
  static String toJson(String key, object) {
    if (object == null) return "";

    if (object is Color) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeColor(object))} ,';
    }
    if (object is String) {
      return '"$key":"$object" ,';
    }
    if (object is num) {
      return '"$key":$object ,';
    }
    if (object is bool) {
      return '"$key":${object.toString()} ,';
    }

    if (object is MainAxisAlignment) {
      return '"$key":"${object.name}" , ';
    }
    if (object is CrossAxisAlignment) {
      return '"$key":"${object.name}" , ';
    }

    if (object is TextAlign) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeTextAlign(object))} ,';
    }
    if (object is EdgeInsets) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeEdgeInsetsGeometry(object))} ,';
    }
    if (object is Alignment) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeAlignment(object))} ,';
    }
    if (object is BoxFit) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeBoxFit(object))} ,';
    }
    if (object is BoxDecoration) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeBoxDecoration(object))} ,';
    }

    if (object is TextStyle) {
      return '"$key": ${jsonEncode(ThemeEncoder.encodeTextStyle(object))} ,';
    }

    return "";
  }
}
