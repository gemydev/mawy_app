import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mawy_app/models/shop.dart';


abstract class ShopsRepository {
  ShopsRepositoryApi shopsRepositoryApi = ShopsRepositoryApi();
  Future<List<ShopData>> getAllShops();
}

class ShopsRepositoryApi extends ShopsRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';

  @override
  Future<List<ShopData>> getAllShops() async {
    final http.Response response = await http.get('$urlServer/show_shops');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      int length = Shops.fromJson(responseAsJson).shopsData.length;
      List<ShopData> list = [];
      for (int i = 0; i < length; i++) {
        list.add(Shops
            .fromJson(responseAsJson)
            .shopsData[i]);
      }
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }


}
