import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mawy_app/blocs/register/register_bloc.dart';
import 'package:mawy_app/constants/colors.dart';
import 'package:mawy_app/functions/navigation_funs.dart';
import 'package:mawy_app/screens/login.dart';
import 'package:mawy_app/widgest/custom_text_field.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseMessaging fcm = FirebaseMessaging();
  String firebaseToken;
  TextEditingController userNameController,
      passwordController,
      addressController,
      phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String password, userName, address, phone;
  RegisterBloc registerBloc;
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
  void dispose() {
    registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(fontSize: 25, color: MAIN_COLOR),
                ),
              ),
              Center(
                child: Icon(
                  Icons.person_pin,
                  color: MAIN_COLOR,
                  size: 120,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        "العنوان",
                        style: TextStyle(color: MAIN_COLOR, fontSize: 22),
                      ),
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                      controller: addressController,
                      hintText: "العنوان",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        "رقم الهاتف",
                        style: TextStyle(color: MAIN_COLOR, fontSize: 22),
                      ),
                    ),
                    CustomTextField(
                      onSaved: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                      controller: phoneController,
                      hintText: "رقم الهاتف",
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
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: BlocBuilder<RegisterBloc, RegisterState>(
                              builder: (BuildContext context, state) {
                            return RaisedButton(
                              onPressed: state is! AuthenticationLoading
                                  ? _signUpOnPressed
                                  : null,
                              color: MAIN_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25, top: 5, bottom: 5),
                                child: Text(
                                  "انشاء حساب",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            );
                          })),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "لديك حساب بالفعل ؟",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                normalShift(context, Login());
                              },
                              child: Text(
                                "قم بتسجيل الدخول",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  _signUpOnPressed() {
    if (_formKey.currentState.validate()) {
      registerBloc.add(SignUpEvent(
          password: password,
          userName: userName,
          phone: phone,
          address: address,
          firebaseToken: firebaseToken));
      normalShift(context, Login());
      _formKey.currentState.reset();
    }
  }
}
