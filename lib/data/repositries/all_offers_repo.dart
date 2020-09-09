import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mawy_app/data/models/offers.dart';

abstract class AllOffersRepository {
  Future<List<Offer>> getAllOffers();
  Future<void> getOfferByOfferId({String offerId});
  Future<void> makeOffer(
      {String shopId, name, cityId, categoryId, bunchId, copon});
  Future<List<Offer>> getMyOffers({int shopId});
  Future<List<Offer>> getMyWaitOffers({int shopId});
  Future<List<Offer>> getMyRefusedOffers({int shopId});
  Future<List<Offer>> getAllMyOffers({int shopId});
  Future<void> updateOffer({String offerId, name, cityId, typeId, File file});
  Future<void> getOfferByName(String name);
}

class AllOfferRepositoryApi implements AllOffersRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';
  bool makeOfferDone;

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
  Future<void> getOfferByOfferId({String offerId}) async {
    final http.Response response =
        await http.get('$urlServer/show_myoffers?shop_id=$offerId');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Offer> list = Offers.fromJson(responseAsJson).allOffers;
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<void> getOfferByName(String name) async{
    final http.Response response =
    await http.post('$urlServer/search_offerByname' , body: {
      "name" : name
    });
    if (response.statusCode != 200) {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<List<Offer>> getMyOffers({int shopId}) async {
    final http.Response response =
        await http.get('$urlServer/show_myoffers?shop_id=$shopId');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Offer> list = Offers.fromJson(responseAsJson).allOffers;
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<List<Offer>> getMyWaitOffers({int shopId}) async {
    final http.Response response =
        await http.get('$urlServer/show_myWaitoffers?shop_id=$shopId');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Offer> list = Offers.fromJson(responseAsJson).allOffers;
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<List<Offer>> getMyRefusedOffers({int shopId}) async {
    final http.Response response =
        await http.get('$urlServer/show_myrefuserdoffers?shop_id=$shopId');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Offer> list = Offers.fromJson(responseAsJson).allOffers;
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<List<Offer>> getAllMyOffers({int shopId}) async {
    final http.Response response =
        await http.get('$urlServer/show_allmyoffers?shop_id=$shopId');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.body);
      List<Offer> list = Offers.fromJson(responseAsJson).allOffers;
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }

  @override
  Future<void> makeOffer(
      {String shopId, name, cityId, categoryId, bunchId, copon}) async {
    http.Response response = await http.post('$urlServer/make_offer', body: {
      'shop_id': shopId,
      'name': name,
      'city_id': cityId,
      'category_id': categoryId,
      'bunch_id': bunchId,
      'copon': copon
    });
    if (response.statusCode != 200) {
      makeOfferDone = false;
      throw Exception("error");
    } else {
      makeOfferDone = true;
    }
  }

  @override
  Future<void> updateOffer(
      {String offerId, name, cityId, typeId, File file}) async {
    http.Response response = await http.post('$urlServer/update_offer', body: {
      'offer_id': offerId,
      'name': name,
      'city_id': cityId,
      'type_id': typeId,
      'file': file
    });
    if (response.statusCode != 200) {
      throw Exception("error");
    }
  }



}
