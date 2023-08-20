import 'package:flutter/material.dart';
import 'package:hi_flutter/util/color.dart';

class LoginInput extends StatefulWidget {
  final String title;

  final String hint;

  final ValueChanged<String> onContentValueChanged;

  final ValueChanged<bool> onFocusValueChanged;

  final bool lineStretch;

  /* 是否启用密码输入类型 */
  final bool enableInputPasswordType;

  /* 文本输入类型 */
  final TextInputType textInputType;

  const LoginInput(this.title, this.hint, this.onContentValueChanged,
      {super.key,
      required this.onFocusValueChanged,
      this.lineStretch = false,
      this.enableInputPasswordType = false,
      required this.textInputType});

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  /* 获取光标的事件 */
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      print("Has focus: ${_focusNode.hasFocus}");
      if (widget.onFocusValueChanged != null) {
        widget.onFocusValueChanged(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 15,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            generateInputBox()
          ],
        ),
      ],
    );
  }

  Expanded generateInputBox() {
    return Expanded(
        child: TextField(
      focusNode: _focusNode,
      onChanged: widget.onContentValueChanged,
      obscureText: widget.enableInputPasswordType,
      keyboardType: widget.textInputType,
      autofocus: !widget.enableInputPasswordType,
      cursorColor: materialColor,
      style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hint ?? 'N/A',
          hintStyle: TextStyle(fontSize: 15, color: Colors.grey)),
    ));
  }
}
