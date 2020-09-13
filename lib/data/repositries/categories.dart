import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mawy_app/data/models/models.dart';

abstract class CategoriesRepository {
  Future<List<Category>> getAllCategories();
}

class CategoriesRepositoryApi implements CategoriesRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';


  @override
  Future<List<Category>> getAllCategories() async{
    final http.Response response = await http.get('$urlServer/show_allCategory');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Category> list = Categories.fromJson(responseAsJson).allCategory;
      return list;
    } else {
      throw Exception('Can not load posts');
    }

  }


}
