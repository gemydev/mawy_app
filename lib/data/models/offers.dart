import 'dart:io';
import 'package:file_picker/file_picker.dart';

class Offers {
  List<Offer> allOffers;
  int error;
  String message;

  Offers({this.allOffers, this.error, this.message});

  Offers.fromJson(Map<String, dynamic> json) {
    if (json['all_offers'] != null) {
      allOffers = new List<Offer>();
      json['all_offers'].forEach((v) {
        allOffers.add(new Offer.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allOffers != null) {
      data['all_offers'] = this.allOffers.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class Offer {
  int id;
  String name;
  String file;
  String shopName;
  String cityName;
  String type;
  String state;
  String createdAt;
  String updatedAt;
  List<Category> category;

  Offer(
      {this.id,
        this.name,
        this.file,
        this.shopName,
        this.cityName,
        this.type,
        this.state,
        this.createdAt,
        this.updatedAt,
        this.category});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    file = json['file'];
    shopName = json['shop_name'];
    cityName = json['city_name'];
    type = json['type'];
    state = json['state'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['category'] != null) {
      category = new List<Category>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file'] = this.file;
    data['shop_name'] = this.shopName;
    data['city_name'] = this.cityName;
    data['type'] = this.type;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String categoryName;

  Category({this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = this.categoryName;
    return data;
  }
}