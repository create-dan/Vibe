// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practise_project/Auth/auth_helper.dart';
import 'package:practise_project/Auth/login_screen.dart';
import 'package:practise_project/screens/onboarding/onboarding_screen.dart';
import 'package:practise_project/widgets/MyTextFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "", _password = "", _username = "", _imageUrl = "", _bio = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_ucbyrun5.json"),
                SizedBox(
                  height: 20.0,
                ),
                MyTextFormField(
                    name: "User Name",
                    onChange: (val) {
                      setState(() {
                        _username = val;
                      });
                    }),
                MyTextFormField(
                    name: "email",
                    onChange: (val) {
                      setState(() {
                        _email = val;
                      });
                    }),
                MyTextFormField(
                    name: "Password",
                    onChange: (val) {
                      setState(() {
                        _password = val;
                      });
                    }),
                MyTextFormField(
                    name: "Bio",
                    onChange: (val) {
                      setState(() {
                        _bio = val;
                      });
                    }),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthHelper()
                          .signUp(
                        email: _email,
                        password: _password,
                      )
                          .then(
                        (val) {
                          print(_email);
                          print(_password);
                          print('in signu');
                          print(val);

                          if (val == null) {
                            return Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnboardingScreen(),
                              ),
                            );
                          }
                        },
                      );
                    },
                    child: Text("Sign Up"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Container(
                    child: Text("Already have an account ? Log In "),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
