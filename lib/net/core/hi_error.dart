import 'dart:convert';

import 'package:hi_flutter/net/http/base_request.dart';

class HiNetError implements Exception {
  final int code;

  final String message;

  final dynamic data;

  HiNetError(this.code, this.message, /* optional */ {this.data});
}

/**
 * auth exception
 */
class NeedAuth extends HiNetError {
  static const CODE = 403;

  NeedAuth({String message = "请先授权", int code = CODE, dynamic data}) : super(code, message, data: data) {}
}

/**
 * login exception
 */
class NeedLogin extends HiNetError {
  static const CODE = 401;

  NeedLogin({String message = "请先授权", int code = CODE, dynamic data}) : super(code, message, data: data) {}
}

/**
 * 返回处理
 */
class HiNetResponse<T> {
  int statusCode = 0;
  T? data;
  BaseRequest? request;
  String? statusMessage;
  dynamic extra;

  HiNetResponse({this.statusCode = 0, this.data, this.request, this.statusMessage, this.extra});

  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    } else {
      return data.toString();
    }
  }
}

abstract class HiNetAdapter {
  Future<HiNetResponse<T>> send<T>();
}
