import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';

import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/screens/your_store.dart';
import 'package:mawy_app/screens/home.dart';
import 'package:mawy_app/screens/test.dart';
import 'package:http/http.dart' as http;
import 'blocs/register/register_bloc.dart';
import 'blocs/register/register_repository.dart';



void main() async {

  RegisterRepository registerRepository;
  runApp(
      MultiBlocProvider(
        providers: [
      BlocProvider<RegisterBloc>(create: (context) => RegisterBloc(registerRepository)),
          BlocProvider<AllOffersBloc>(create: (context) => AllOffersBloc())
        ],
        child: MyApp(),
      )
  );


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mawy',
      theme: ThemeData(
        primaryColor: MAIN_COLOR,
        accentColor: MAIN_COLOR
      ),
      home: HomeScreen()
    );
  }
}

