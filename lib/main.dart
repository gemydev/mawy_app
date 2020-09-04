import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/register/register_bloc.dart';
import 'package:mawy_app/data/register_repository.dart';
import 'package:mawy_app/screens/home.dart';
import 'package:mawy_app/screens/test.dart';
import 'package:http/http.dart' as http;

void main() async {

  RegisterRepository registerRepository;
  runApp(BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc(registerRepository) ,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mawy',
      home: HomeScreen()
    );
  }
}

