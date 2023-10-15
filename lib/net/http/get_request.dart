import 'package:hi_flutter/net/http/base_request.dart';

class GetRequest extends BaseRequest {
  GetRequest() {
    useHttps = false;
  }

  @override
  Method method() {
    return Method.GET;
  }

  @override
  String path() {
    return "/api/v1/test/get";
  }

  @override
  bool needLogin() {
    return false;
  }
}
