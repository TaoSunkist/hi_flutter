import 'package:hi_flutter/net/http/get_request.dart';

enum Method { GET, POST }

/// curl "http://127.0.0.1:8080/api/v1/test/get"
abstract class BaseRequest {
  static const TAG = "BaseRequest";

  var hostUrl = "120.79.80.230:8080";

  var useHttps = true;

  var pathParams;

  String host() {
    return hostUrl;
  }

  Method method();

  String path();

  String url() {

    Uri uri;
    print("useHttps: ${useHttps}, ${host()},${path()}");
    if (useHttps) {
      uri = Uri.https(host(), path(), params);
    } else {
      uri = Uri.http(host(), path(), params);
    }
    print("$TAG ${uri.toString()}");

    return uri.toString();
  }

  bool needLogin();

  Map<String, Object> params = {};

  ///使用的时候不需要进行转换
  Map<String, dynamic> header = {};

  /// 添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    print("$TAG add params  $k: $v");
    return this;
  }

  /// 添加参数
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    print("$TAG add header  $k: $v");
    return this;
  }
}
