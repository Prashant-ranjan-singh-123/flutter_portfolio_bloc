import 'package:dio/dio.dart';

class DioClient{
  DioClient._();
  static const String baseUrl = '';
  static Dio instance(){
    return Dio(BaseOptions(baseUrl: baseUrl));
  }
}