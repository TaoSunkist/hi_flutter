import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hi_flutter/ui/login/widget/login_input_box.dart';

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
                  'Welcome to register',
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
          LoginInputBox(
            "确认密码",
            "请输入密码",
            onContentValueChanged: (String value) {
              print(value);
            },
            onFocusValueChanged: (bool value) {
              print("密码 focused");
            },
            enableInputPasswordType: true,
            textInputType: TextInputType.text,
            clearContentGestureTapCallback: () {},
          ),
        ]),
      ),
    );
  }
}
