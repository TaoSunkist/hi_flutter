import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../util/color.dart';
import '../reusable/gradient_app_bar.dart';
import '../reusable/widget/login_input_box.dart';

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
        onBackPressCallback: () {
          print(" onBackPressCallback");
        },
      ),
      /** 使用ListView可以方便小屏幕的滚动, 自适应键盘防止遮挡
       * 另外如果item较为复杂可以考虑使用 ListView.builder/ ListView.separated */
      body: Container(
        child: ListView(children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  'Welcome to login',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          LoginInputBox(
            "账号",
            "请输入账号",
            onContentValueChanged: (String value) {
              print(value);
            },
            onFocusValueChanged: (bool value) {
              print("密码 focused");
            },
            enableInputPasswordType: false,
            textInputType: TextInputType.text,
            clearContentGestureTapCallback: () {
              print("clear content");
            },
          ),
          LoginInputBox(
            "密码",
            "请输入密码",
            lineStretch: false,
            onContentValueChanged: (String value) {
              print(value);
            },
            onFocusValueChanged: (bool value) {
              print("密码 focused");
            },
            enableInputPasswordType: true,
            textInputType: TextInputType.text,
            clearContentGestureTapCallback: () {
              print("clear content");
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20,top: 10),
            child: MaterialButton(
              textColor: materialColors.shade50,
              color: materialColor,
              onPressed: () {
              },
              child: Text("立即注册"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            ),
          )
        ]),
      ),
    );
  }
}
