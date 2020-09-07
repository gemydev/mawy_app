import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mawy_app/models/offers.dart';


abstract class AllOffersRepository {
  AllOfferRepositoryApi allOfferRepositoryApi = AllOfferRepositoryApi();
  Future<List<Offer>> getAllOffers();
  Future<void> getOfferByCat();
  Future<void> getOfferByCatAndCity();
}

class AllOfferRepositoryApi extends AllOffersRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';

  @override
  Future<List<Offer>> getAllOffers() async {
    final http.Response response = await http.get('$urlServer/show_offers');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      int length = Offers.fromJson(responseAsJson).allOffers.length;
      List<Offer> list = [];
      for (int i = 0; i < length; i++) {
        list.add(Offers.fromJson(responseAsJson).allOffers[i]);
      }
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<void> getOfferByCat() {
    throw UnimplementedError();
  }

  @override
  Future<void> getOfferByCatAndCity() {
    throw UnimplementedError();
  }
}
