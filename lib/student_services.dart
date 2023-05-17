import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:json_project/student_model.dart';

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Future<Student> loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  Student student = Student.fromJson(jsonResponse);
 return student;
}