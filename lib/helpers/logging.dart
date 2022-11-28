import 'package:dio/dio.dart';
import 'package:iWarden/configs/configs.dart';
import 'package:iWarden/screens/login_screens.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    if (err.response?.statusCode == 401) {
      // NavigationService.navigatorKey.currentState!
      //     .pushReplacementNamed(LoginScreen.routeName);
      print('ao ma');
    }
    return super.onError(err, handler);
  }
}
