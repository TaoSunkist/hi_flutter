
import 'package:hi_flutter/net/http/base_request.dart';

class GetRequest extends BaseRequest{

  @override
  Method method() {
    return Method.GET;
  }

  @override
  String path() {
    return "/api/v1/test";
  }

  @override
  bool needLogin() {
    // TODO: implement needLogin
    throw UnimplementedError();
  }

}