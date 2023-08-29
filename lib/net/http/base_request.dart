enum Method { GET, POST, DELETE }

abstract class BaseRequest {
  String pathParams = "";

  var useHttps = true;

  String host() {
    /* TODO SOMETHING */
    return "todo";
  }

  Method method();

  String path();

  String url() {
    var _path = path();
    if (_path.isNotEmpty) {
    } else {}
    Uri uri = Uri(scheme: "", host: host(), port: 8080, path: _path);
    return uri.toString();
  }
}
