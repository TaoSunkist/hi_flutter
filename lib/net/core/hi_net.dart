import 'package:flutter/scheduler.dart';
import 'package:hi_flutter/net/core/hi_error.dart';
import 'package:hi_flutter/net/http/base_request.dart';

class HiNet {
  HiNet._();

  static HiNet? _instance;

  factory HiNet.getInstance() {
    _instance ??= HiNet._();
    return _instance!;
  }

  Future fire(BaseRequest request) async {
    HiNetResponse? hiNetResponse;
    var error;

    try {
      hiNetResponse = await send(request);
    } on HiNetError catch (e) {
      error = e;
      hiNetResponse = e.data;
      printLog(e.message);
    } catch (e) {
      /* 兜底 */
      error = e;
      printLog(e);
    }
    if (hiNetResponse == null) {
      printLog(error);
    }

    // var response = await send(request);
    var result = hiNetResponse!.data; //response['data'];
    printLog(result);
    var statusCode = hiNetResponse.statusCode;
    switch (statusCode) {
      case 200:
        {
          /* ok */
        }
        break;
      case NeedAuth.CODE:
        {
          /*TODO TIPS*/
          throw NeedAuth();
        }
      case NeedLogin.CODE:
        {
          throw NeedLogin(message: result.toString(), data: result);
          /*TODO TIPS*/
        }
      default:
        {
          throw HiNetError(hiNetResponse.statusCode, hiNetResponse.toString());
        }
    }
    return result;
  }

  void printLog(log) {
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
