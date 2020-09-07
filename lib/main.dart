import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/blocs/shops/shops_bloc.dart';
import 'models/shop.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/screens/home.dart';
import 'package:http/http.dart' as http;
import 'blocs/register/register_bloc.dart';
import 'blocs/register/register_repository.dart';

void main() async {

  RegisterRepository registerRepository;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(registerRepository)),
      BlocProvider<AllOffersBloc>(
          create: (context) => AllOffersBloc()..add(FetchAllOffers())),
      BlocProvider<ShopsBloc>(
          create: (context) => ShopsBloc()..add(GetShops())),
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
      list.add(Shops
          .fromJson(responseAsJson)
          .shopsData[i]);
    }
    return list;
  } else {
    throw Exception('Can not load posts');
  }
}