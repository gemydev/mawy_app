import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/blocs/categories/category_bloc.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/repositries/repositries.dart';
import 'package:mawy_app/preference_healper/src/preference_bloc.dart';
import 'package:mawy_app/screens/chat.dart';
import 'package:mawy_app/screens/home.dart';
import 'package:mawy_app/screens/screens.dart';
import 'package:mawy_app/screens/test.dart';
import 'package:mawy_app/screens/test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/shared_preferences/usage_prefs_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<RegisterBloc>(
          create: (context) =>
              RegisterBloc(repository: RegisterRepositoryApi())),
      BlocProvider<PreferenceBloc>(
          create: (context) => PreferenceBloc(
              sharedPreferences: sharedPreferences,
              usagePreferences: usagePreferenceList)),
      BlocProvider<AllOffersBloc>(
          create: (context) =>
              AllOffersBloc(repository: AllOfferRepositoryApi())),
      BlocProvider<CategoryBloc>(
          create: (context) =>
              CategoryBloc(repository: CategoriesRepositoryApi())),
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
