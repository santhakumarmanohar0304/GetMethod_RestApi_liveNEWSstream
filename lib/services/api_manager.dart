import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getmethod_livenewsstream/models/newsinfo.dart';
import 'package:http/http.dart' as http;
import 'package:getmethod_livenewsstream/constants/string.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();

    var newsModel = null;
    try {
      var response = await client.get(Strings.news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
