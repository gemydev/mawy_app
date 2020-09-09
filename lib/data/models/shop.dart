import 'offers.dart';

class Shops {
  List<ShopData> shopsData;
  int error;
  String message;

  Shops({this.shopsData, this.error, this.message});

  Shops.fromJson(Map<String, dynamic> json) {
    if (json['shops_data'] != null) {
      shopsData = new List<ShopData>();
      json['shops_data'].forEach((v) {
        shopsData.add(new ShopData.fromJson(v));
      });
    }
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopsData != null) {
      data['shops_data'] = this.shopsData.map((v) => v.toJson()).toList();
    }
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}

class ShopData {
  int id;
  String shopName;
  String image;
  String cityName;
  List<Category> category;

  ShopData({this.id, this.shopName, this.image, this.cityName, this.category});

  ShopData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    image = json['image'];
    cityName = json['city_name'];
    if (json['category'] != null) {
      category = new List<Null>();
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['image'] = this.image;
    data['city_name'] = this.cityName;
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}