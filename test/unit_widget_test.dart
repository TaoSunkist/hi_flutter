// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hi_flutter/main.dart';
import 'package:hi_flutter/net/core/hi_net.dart';
import 'package:hi_flutter/net/http/base_request.dart';
import 'package:hi_flutter/net/http/get_request.dart';

void main() {
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
  test(
      "base_request",
      () => () async {
            print("object");
            var getRequest = GetRequest();
            getRequest.add("param1", "param value1").add("param2", "param value2").addHeader("header-1", "header-1");
            var result = await HiNet.getInstance().fire(getRequest);
            print(result);
          }());

  void doSomething(void Function() callback) {
    callback();
    print("callback run over");
  }
  /*
  kotlin
  fun test(description: String, testFunction: (() -> Unit)? = null) {
    println(description)
    testFunction?.invoke() ?: { println("hi option func argument") }()
  }
   */
  test(
      "option func argument",
      () => () {
            print("hi option func argument");
            doSomething(() {});
          }());


  // test(
  //     "base_request2",
  //         () => () async {
  //       print("object");
  //       // var getRequest = GetRequest();
  //       // getRequest.add("param1", "param value1").add("param2", "param value2").addHeader("header-1", "header-1");
  //       // var result = await HiNet.getInstance().fire(getRequest);
  //       // print(result);
  //     }()
  // );
}
