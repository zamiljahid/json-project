import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:json_project/user_model.dart';

Future<String> _loadUserAsset() async{
  return await rootBundle.loadString('assets/user.json');
}

Future<UserList> loadUser() async{
  String jsonString = await _loadUserAsset();
  final jsonResponse = json.decode(jsonString);
  UserList userList = UserList.fromJson(jsonResponse);
  return userList;
}