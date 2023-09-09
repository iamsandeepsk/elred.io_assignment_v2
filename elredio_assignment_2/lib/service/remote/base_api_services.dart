
import 'package:dio/dio.dart';

abstract class BaseApiServices {
  ///
  Future<dynamic> getRequest({
    required String url,
  });

  ///
  Future<dynamic> postRequest({
    required String url,
    
    required bool isFormData,
    required bool isJson,
    Map<String, dynamic>? data,
    FormData? formData,
    
    
  });
  
}
