import 'package:flutter/material.dart';
import 'package:hi_flutter/util/color.dart';

class LoginInputBox extends StatefulWidget {
  final String title;

  final String hint;

  final ValueChanged<String> onContentValueChanged;

  final ValueChanged<bool> onFocusValueChanged;

  final bool lineStretch;

  /* 是否启用密码输入类型 */
  final bool enableInputPasswordType;

  /* 文本输入类型 */
  final TextInputType textInputType;

  final VoidCallback clearContentGestureTapCallback;

  const LoginInputBox(
    this.title,
    this.hint, {
    super.key,
    required this.onContentValueChanged,
    required this.onFocusValueChanged,
    this.lineStretch = false,
    required this.enableInputPasswordType,
    required this.textInputType,
    required this.clearContentGestureTapCallback,
  });

  @override
  State<LoginInputBox> createState() => _LoginInputBoxState();
}

class _LoginInputBoxState extends State<LoginInputBox> {
  /* 获取光标的事件 */
  final _focusNode = FocusNode();

  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      widget.onFocusValueChanged(_focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
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
              width: 100,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _generateInputBox(),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {
                  _textEditingController.clear();
                },
                child: SizedBox(
                    child: Icon(
                  Icons.clear_outlined,
                  color: materialColor,
                  size: 18.0,
                )),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: !widget.lineStretch ? 15 : 0, right: !widget.lineStretch ? 15 : 0),
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: materialColor,
          ),
        )
      ],
    );
  }

  Expanded _generateInputBox() {
    return Expanded(
        child: TextField(
      controller: _textEditingController,
      focusNode: _focusNode,
      onChanged: (String content) {
        widget.onContentValueChanged.call;
      },
      obscureText: widget.enableInputPasswordType,
      keyboardType: widget.textInputType,
      autofocus: !widget.enableInputPasswordType,
      cursorColor: materialColor,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hint ?? 'N/A',
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey)),
    ));
  }
}
