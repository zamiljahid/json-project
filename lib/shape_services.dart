import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_project/shape_model.dart';
import 'dart:convert';

Future<String> _loadShapeAsset() async {
  return await rootBundle.loadString('assets/shape.json');
}

Future loadShape() async {
  String jsonString = await _loadShapeAsset();
  final jsonResponse = json.decode(jsonString);
  Shape shape = Shape.fromJson(jsonResponse);
  print(shape.property.breadth);
}