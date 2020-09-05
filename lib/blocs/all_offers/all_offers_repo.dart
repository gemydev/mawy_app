
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mawy_app/models/offers.dart';
import 'package:mawy_app/models/user.dart';

abstract class AllOffersRepository {
  RegisterRepositoryApi registerRepositoryApi = RegisterRepositoryApi() ;
  Future<List<Offer>> getAllOffers();
  Future<void> getOfferByCat();
  Future<void> getOfferByCatAndCity();
}

class RegisterRepositoryApi extends AllOffersRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';

  @override
  Future<List<Offer>> getAllOffers() async {
    final response = await http.get('$urlServer/show_offers');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Offer>((item) => Offer.fromJson(item)).toList();
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<void> getOfferByCat() {
    // TODO: implement getOfferByCat
    throw UnimplementedError();
  }

  @override
  Future<void> getOfferByCatAndCity() {
    // TODO: implement getOfferByCatAndCity
    throw UnimplementedError();
  }


}
