import 'package:flutter/material.dart';

import 'components/body.dart';

class SignInPage extends StatefulWidget {
  @override
  SignInScreen createState() => SignInScreen();
}

class SignInScreen extends State<SignInPage> {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
