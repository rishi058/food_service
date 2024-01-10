import 'package:dio/dio.dart';

class RadioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = 'https://theoptimiz.com/restro/public/api/';
    super.onRequest(options, handler);
  }

}

class FoodApi{
  Dio dio = Dio();
  FoodApi(){
    dio.interceptors.add(RadioInterceptor());
  }
}