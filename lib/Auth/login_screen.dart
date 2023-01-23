// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:practise_project/Auth/auth_helper.dart';
import 'package:practise_project/screens/onboarding/onboarding_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = "", _password = "";

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
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (input) => _email = input!,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onSaved: (input) => _password = input!,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthHelper()
                          .signIn(
                        email: _email,
                        password: _password,
                      )
                          .then(
                        (val) {
                          print(val);
                          return Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen(),
                            ),
                          );
                        },
                      );
                    },
                    child: Text("LOGIN"),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Container(
                    child: Text("Don't have an account ? Sign Up "),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingScreen(),
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Perform authentication here
    }
  }
}
