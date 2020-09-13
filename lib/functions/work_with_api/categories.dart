import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mawy_app/data/models/categories.dart';

Future<List<Category>> getAllCategories({int shopId, String content}) async {
  http.Response response = await http
      .get('http://mawyApi.codecaique.com/api/show_allCategory',);
  if (response.statusCode == 200) {
    var responseAsJson = json.decode(response.body);
    List<Category> list = Categories.fromJson(responseAsJson).allCategory;
    return list;
  } else {
    throw Exception('Can not load posts');
  }
}