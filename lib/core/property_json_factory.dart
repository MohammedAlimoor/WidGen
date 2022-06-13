import 'package:flutter/material.dart';
import 'package:wid_gen/properties/alignment_properties.dart';
import 'package:wid_gen/properties/box_fit_properties.dart';
import 'package:wid_gen/properties/edgeinsets_properties.dart';
import 'package:wid_gen/properties/text_weight_properties.dart';

class PropertyJsonFactory {
  static String toJson(String key, object) {
    if (object == null) return "";

    if (object is Color) {
      return '"$key":"#${object.value.toRadixString(16)}" ,';
    }
    if (object is String) {
      return '"$key":"${object}" ,';
    }
    if (object is num) {
      return '"$key":${object} ,';
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
    if (object is EdgeInsets) {
      return '"$key":"${EdgeInsetsProperties.getValue(object)}" , ';
    }
    if (object is Alignment) {
      return '"$key":"${AlignmentProperties.getValue(object)}" ,';
    }
    if (object is BoxFit) {
      return '"$key":"${BoxFitProperties.getValue(object)}" ,';
    }
    if (object is TextStyle) {
      return '''
     "$key": {
        ${PropertyJsonFactory.toJson("color", object.color)}
          ${PropertyJsonFactory.toJson("fontSize", object.fontSize)}
         ${PropertyJsonFactory.toJson("fontFamily", object.fontFamily)}
          ${PropertyJsonFactory.toJson("fontWeight", TextWeightProperties.getValue(object.fontWeight) ?? "")}
      },
      ''';
    }
    return "";
  }
}
