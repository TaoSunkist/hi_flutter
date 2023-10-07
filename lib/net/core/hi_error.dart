class HiNetError implements Exception {
  final int code;

  final String message;

  final dynamic data;

  HiNetError(this.code, this.message, {this.data});

}
