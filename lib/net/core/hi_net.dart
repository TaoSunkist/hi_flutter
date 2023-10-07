import 'package:hi_flutter/net/http/base_request.dart';

class HiNet {
  HiNet._();

  static HiNet? _instance;

  factory HiNet.getInstance() {
    if (_instance == null) {
      _instance = HiNet._();
    }
    return _instance!;
  }

  Future fire(BaseRequest request) async{
    var response = await send(request);
    var result  = response['data'];
    printLog(result);
    return result;
  }

  void printLog(log){
    print('hi_net: ${log.toString()}');
  }

  Future<dynamic> send<T>(BaseRequest request) async {
    printLog("url: ${request.url()}");
    printLog("method: ${request.method()}");
    request.addHeader("header1", "header value1");
    printLog("header: ${request.header}");
    return Future.value({
      "statusCode": 200,
      "data": {"code": 0, "message": "succeed"}
    });
  }
}
