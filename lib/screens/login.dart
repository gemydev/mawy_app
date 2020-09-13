import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/data/shared_preferences/prefs_keys.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/preference_healper/preference_helper.dart';
import 'package:mawy_app/preference_healper/src/preference_bloc.dart';
import 'package:mawy_app/screens/signup.dart';
import 'package:mawy_app/screens/your_store.dart';
import 'package:mawy_app/widgest/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameController,
      passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userName, password;
  FirebaseMessaging fcm = FirebaseMessaging();
  String firebaseToken;
  RegisterBloc registerBloc;
  PreferenceBloc preferenceBloc;
  Future<void> getToken() async {
    await fcm.getToken().then((value) => firebaseToken = value);
  }

  @override
  void initState() {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
    preferenceBloc = BlocProvider.of<PreferenceBloc>(context);
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            color: SECOND_COLOR,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 10),
            child: Form(
              key: _formKey,
              child: Column(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(fontSize: 25, color: MAIN_COLOR),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "اسم المستخدم",
                      style: TextStyle(color: MAIN_COLOR, fontSize: 22),
                    ),
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      setState(() {
                        userName = value;
                      });
                    },
                    controller: userNameController,
                    hintText: "اسم المستخدم",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "كلمة السر",
                      style: TextStyle(color: MAIN_COLOR, fontSize: 22),
                    ),
                  ),
                  CustomTextField(
                    onSaved: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    controller: passwordController,
                    hintText: "كلمة السر",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      return Center(
                        child: RaisedButton(
                          onPressed: () async {
                            SharedPreferences shared = await SharedPreferences.getInstance();
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              registerBloc.add(LoginEvent(
                                  password: password,
                                  userName: userName,
                                  firebaseToken: firebaseToken));
                              if(state is LoginState){
                                await shared.setInt(ID_KEY, state.user.id);
                                await shared.setString(PHONE_NUMBER_KEY, state.user.phone);
                                await shared.setString(USER_NAME_KEY, state.user.userName);
                                await shared.setString(FIREBASE_TOKEN_KEY, firebaseToken);
                                await shared.setString(NAME_KEY, state.user.name);
                                await shared.setString(FIRST_NAME_KEY, state.user.firstName);
                                await shared.setString(LAST_NAME_KEY, state.user.lastName);
                                await shared.setString(SHOP_NAME_KEY, state.user.shopName);
                              shiftByReplacement(context, YourStore());
                                _formKey.currentState.reset();
                              }

                              if(state is AuthenticationLoading){
                                print("AuthenticationLoading");
                              }
                              if(state is ErrorState){
                                print(state.message);
                              }

                            }
                          },
                          color: MAIN_COLOR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            child: Text(
                              "تسجيل الدخول",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "ليس لديك حساب ؟",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpScreen()));
                            },
                            child: Text(
                              "قم بانشاء حساب",
                              style: TextStyle(
                                  color: MAIN_COLOR,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }



  @override
  void dispose() {
    registerBloc.close();
    preferenceBloc.close();
    super.dispose();
  }
}

/*
updateDataOfUser(
                                  keys: keysListOfPrefsUser,
                                  preferenceBloc: preferenceBloc,
                                  firebaseToken: state.user.firebaseToken,
                                  userName: state.user.userName,
                                  id: state.user.id,
                                  name: state.user.name,
                                  shopName: state.user.shopName,
                                  phoneNumber: state.user.phone,
                                  firstName: state.user.firstName,
                                  lastName: state.user.lastName,
                                );
 */
