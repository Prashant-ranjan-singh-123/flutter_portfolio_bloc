import 'package:dio/dio.dart';
import 'client.dart';

class EndPoints{
  EndPoints._();
  static EndPoints instanse(){
    return EndPoints._();
  }

  Future<Response> direction() async {
    try{
      Response response = await DioClient.instance().get('/');
      return response;
    }on DioException catch (e){
      return e.response!;
    }
  }
}