import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/models/models.dart';
import 'package:mawy_app/data/repositries/repositries.dart';
import 'package:mawy_app/screens/home.dart';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegisterBloc>(
          create: (context) =>
              RegisterBloc(repository: RegisterRepositoryApi())),
      BlocProvider<AllOffersBloc>(
          create: (context) =>
              AllOffersBloc(repository: AllOfferRepositoryApi())),
      BlocProvider<ShopsBloc>(
          create: (context) => ShopsBloc(repository: ShopsRepositoryApi())),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mawy',
        theme: ThemeData(primaryColor: MAIN_COLOR, accentColor: MAIN_COLOR),
        home: HomeScreen());
  }
}

String urlServer = 'http://mawyApi.codecaique.com/api';
Future<List<ShopData>> getAllShops() async {
  final http.Response response = await http.get('$urlServer/show_shops');
  if (response.statusCode == 200) {
    var responseAsJson = json.decode(response.body);
    int length = Shops.fromJson(responseAsJson).shopsData.length;
    List<ShopData> list = [];
    for (int i = 0; i < length; i++) {
      list.add(Shops.fromJson(responseAsJson).shopsData[i]);
    }
    return list;
  } else {
    throw Exception('Can not load posts');
  }
}
