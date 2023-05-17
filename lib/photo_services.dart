import 'dart:async' show Future;
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:json_project/photo_model.dart';

Future<String> _loadPhotoAsset() async{
  return await rootBundle.loadString('assets/photo.json');
}

Future<PhotoList> loadPhoto() async{
  String jsonString = await _loadPhotoAsset();
  final jsonResponse = json.decode(jsonString);
  PhotoList photoList = PhotoList.fromJson(jsonResponse);
  return photoList;
}