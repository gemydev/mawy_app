import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mawy_app/models/user.dart';

abstract class RegisterRepository {
  RegisterRepositoryApi registerRepositoryApi = RegisterRepositoryApi() ;
  Future<void> login(User user);
  Future<void> signUp(User user);
}

class RegisterRepositoryApi extends RegisterRepository {
  String urlServer = 'http://mawyApi.codecaique.com/api';



  @override
  Future<void> login(User userObject) async {
    String url = '$urlServer/login';
    http.Response response = await http.post(url, body: userObject.toJson());

  }

  Future<void> signUp(User userObject) async {
    String url = '$urlServer/regesteration';
    await http
        .post(url, body: userObject.toJson())
        .then((value) => print(value.body.toString()));
  }
}
