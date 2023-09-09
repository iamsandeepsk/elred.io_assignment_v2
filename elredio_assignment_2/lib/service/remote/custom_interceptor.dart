import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomInterceptor extends Interceptor {
  Logger logger;

  CustomInterceptor(this.logger);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///
    var data = options.data.toString();

    ///
    if (options.data is FormData) {
      data = (options.data as FormData).fields.toString();
    }

    ///
    logger.d(
      "Request :: URL : ${options.uri}\n Headers : ${options.headers.toString()}\n Params : $data",
    );

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    ///
    logger.d(
      "Error ::  ${err.message}",
    );
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(response.data);

    log(
      "Json $prettyJson",
      name: "Server Response",
    );

    ///
    // logger.d(
    //   "Response ::  ${response.data.toString()}",
    // );

    return handler.next(response);
  }
}
