import 'package:hi_flutter/net/http/get_request.dart';

enum Method { GET, POST }

/// curl "http://127.0.0.1:8080/api/v1/test/get"
abstract class BaseRequest {
  factory BaseRequest(Method method) {
    if (Method.GET == method) {
      /* NOTHING */
    } else if (Method.POST == method) {
      /* NOTHING */
    } else {
      throw Exception("unkonwn method type");
      /* NOTHING */
    }
    return GetRequest();
  }

  static const TAG = "BaseRequest";

  var hostUrl = "http://127.0.0.1:8080";

  var useHttps = true;

  var pathParams;

  String host() {
    return hostUrl;
  }

  Method method();

  String path();

  String url() {
    var pathStr = path();

    if (pathStr.isNotEmpty) {
    } else {}
    Uri uri = Uri(scheme: "", host: host(), port: 8080, path: pathStr);

    if (useHttps) {
      uri = Uri.https(hostUrl, path(), pathParams);
    } else {
      uri = Uri.http(hostUrl, path(), pathParams);
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
