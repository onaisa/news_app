import 'package:dio/dio.dart';

class DioHilper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> quary}) async {
    return await dio.get(url, queryParameters: quary);
  }
}
