import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:json_project/page_model.dart';

Future<String> _loadPageAsset() async{
  return await rootBundle.loadString('assets/page.json');
}

Future<PageCl> loadPage() async{
  String jsonString = await _loadPageAsset();
  final jsonResponse = json.decode(jsonString);
  PageCl page = PageCl.fromJson(jsonResponse);
  return page;
}