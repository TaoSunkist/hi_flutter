import 'package:flutter/material.dart';

import '../reusable/gradient_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final int fromType = 1;

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "注册",
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                'Welcome to register',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.none,
                    color: Theme.of(context).primaryColor,
                    fontSize: 18),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
