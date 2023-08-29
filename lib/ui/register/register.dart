import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hi_flutter/ui/reusable/gradient_app_bar.dart';
import 'package:hi_flutter/ui/reusable/widget/login_input_box.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "title", onBackPressCallback: () {}),
      body: Container(
        child: Column(
          children: [
            Row(
              children: [
                LoginInputBox("账号", "请输入账号",
                    onContentValueChanged: (String content) {},
                    onFocusValueChanged: (bool isFocus) {},
                    enableInputPasswordType: false,
                    textInputType: TextInputType.text, clearContentGestureTapCallback: () {
                  /* 绑定输入框得点击按钮回调清空输入框 */
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
