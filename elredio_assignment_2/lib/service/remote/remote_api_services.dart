import 'package:dio/dio.dart';
import 'package:elredio_assignment_2/resource/src/api_endpoint.dart';
import 'package:elredio_assignment_2/service/exception/app_exceptions.dart';
import 'package:elredio_assignment_2/service/remote/base_api_services.dart';
import 'package:elredio_assignment_2/service/remote/custom_interceptor.dart';
import 'package:logger/logger.dart';

class NetworkApiServices extends BaseApiServices {
  ///
  static Map<String, String> requestHeaders = {
    "Accept": "*/*",
    'Authorization':
        'Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiclhnY1Y2YXh3eVRobTNQdE04aGtSaXJTQ2ZsMiIsImlhdCI6MTY5NDAxNzk4NiwiZXhwIjoxNjk1MzEzOTg2fQ.H78KOAS569qre2u0mJY8YWAKzrtzWRRNOJs-PXoOB1E'
  };
  var connectionTimeOut = 30;
  var receiveTimeout = 30;
  var sendTimeout = 30;

  late Logger logger;
  late Dio dio;
  late BaseOptions baseOptions;

  static NetworkApiServices get getInstance => NetworkApiServices._();

  NetworkApiServices._() {
    ///
    baseOptions = BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      headers: requestHeaders,
      connectTimeout: Duration(seconds: connectionTimeOut),
      sendTimeout: Duration(seconds: sendTimeout),
      receiveTimeout: Duration(seconds: receiveTimeout),
    );

    ///
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 0,
        colors: false,
        printEmojis: true,
        printTime: false,
      ),
    );

    ///
    dio = Dio(baseOptions);

    dio.interceptors.add(CustomInterceptor(logger));
  }

  @override
  Future<Map<String, dynamic>> getRequest({required String url}) async {
    try {
      ///
      Response response = await dio.get(
        url,
      );

      ///
      return returnResponse(response: response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<Map<String, dynamic>> postRequest({
    required String url,
    required bool isFormData,
    required bool isJson,
    Map<String, dynamic>? data,
    FormData? formData,
  }) async {
    ///
    if (isFormData) {
      ///
      assert(
        formData != null,
        throw Exception('Please send a form data'),
      );

      ///
      dio.options.headers[Headers.contentTypeHeader] =
          Headers.multipartFormDataContentType;

      ///
      dio.options.headers[Headers.contentLengthHeader] =
          (formData as FormData).length;
    } else if (isJson) {
      ///
      assert(
        data != null,
        throw Exception('Please send a json data'),
      );

      ///
      dio.options.headers[Headers.contentTypeHeader] = Headers.jsonContentType;
    }

    try {
      ///
      Response response = await dio.post(
        url,
        data: isFormData ? formData : data,
      );

      ///
      return returnResponse(response: response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  ///
  Map<String, dynamic> returnResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = json.decode(response.data);
        // return responseJson;
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 404:
        throw BadRequestException(response.data.toString());
      case 500:
        throw BadRequestException(response.data.toString());
      default:
        throw FetchDataException(
          "Error accourded while communicating with server with status code ${response.statusCode}",
        );
    }
  }
}
