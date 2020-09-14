import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mawy_app/data/models/models.dart';

abstract class RegisterRepository {
  Future<void> login({String userName, password, firebaseToken});
  Future<void> signUp({String userName, address, phone, password , firebaseToken});
}

class RegisterRepositoryApi implements RegisterRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';
  bool loginDone ;
  bool signUpDone;
  @override
  Future<UserData> login({String userName, password, firebaseToken}) async {
    String url = '$urlServer/login';
    http.Response response = await http.post(url, body: {
      "user_name": userName,
      "passwords": password,
      "firebase_token": firebaseToken
    });
    if (response.statusCode != 200) {
      loginDone = false;
      throw Exception("error");
    }else{
      loginDone = true;
      var responseAsJson = json.decode(response.body);
      UserData userData = UserData.fromJson(responseAsJson['user_data']);
      print("Hello from login Function with id = ${userData.id}");
      return userData;
    }
  }

  Future<void> signUp(
      {String userName, address, phone, password, firebaseToken}) async {
    String url = '$urlServer/regesteration';
    http.Response response = await http.post(url, body: {
      "user_name": userName,
      "phone": phone,
      "address": address,
      "passwords": password,
      "firebase_token": firebaseToken
    });
    if (response.statusCode != 200) {
      throw Exception("error");
    }
  }
}
