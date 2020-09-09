import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/blocs.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/signup.dart';
import 'package:mawy_app/screens/your_store.dart';
import 'package:mawy_app/widgest/custom_text_field.dart';

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
  String firebaseToken ;
  RegisterBloc registerBloc ;
  Future<void> getToken() async {
    await fcm.getToken().then((value) => firebaseToken = value);
  }

  @override
  void initState() {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
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
                padding: const EdgeInsets.only(
                    top: 10, left: 8, right: 8, bottom: 10),
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
                        onChange: (value) {
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
                        onChange: (value) {
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
                              onPressed:() {
                                _loginOnPressed();
                                if(state is LoginState){
                                  if(state.done == true){
                                    shiftByReplacement(context, YourStore());
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
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
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
  _loginOnPressed() {
    if (_formKey.currentState.validate()) {
      registerBloc.add(LoginEvent(
          password: password,
          userName: userName,
          firebaseToken: firebaseToken));
    }
  }
  @override
  void dispose() {
    registerBloc.close();
    super.dispose();
  }
}
