import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/helpers/logging.dart';

final serviceURL = dotenv.get(
  'SERVICE_URL',
);

class DioHelper {
  static Dio get defaultApiClient => ApiClientBuilder()
      .ofUrl(serviceURL)
      .setDefaultHeader()
      .addInterceptor(Logging())
      .create();
}

class ApiClientBuilder {
  static const int defaultTimeout = 15000;

  Dio dio = Dio(BaseOptions(
      connectTimeout: defaultTimeout,
      receiveTimeout: defaultTimeout,
      sendTimeout: defaultTimeout));

  ApiClientBuilder addInterceptor(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
    return this;
  }

  ApiClientBuilder ofUrl(String url) {
    dio.options.baseUrl = url;
    return this;
  }

  ApiClientBuilder setTimeout(int timeout) {
    dio.options.connectTimeout = timeout;
    dio.options.sendTimeout = timeout;
    dio.options.receiveTimeout = timeout;
    return this;
  }

  ApiClientBuilder setDefaultHeader() {
    // SharedPreferencesHelper.getStringValue(AuthProvider.JWT_KEY).then((value) {
    //   if (value != null) {
    //     jwt = value;
    //     dio.options.headers['content-Type'] = 'application/json';
    //     dio.options.headers["authorization"] = "Bearer $value";
    //     print("value $value");
    //   }
    //   return this;
    // });
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njk2Mjg4MDQsIm5iZiI6MTY2OTYyODgwNCwiZXhwIjoxNjY5NjMyNzA0LCJhaW8iOiJBVFFBeS84VEFBQUFaTkRIV29vTlZCaERrOU02Y05QMnBHWUt1UXUrMXJsSTVlczMzMUE1Mk9xZHhzTTkwRHcveFR0T0FBVjQ2NFBLIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiJjZjA0MGU0Yi1lYTAyLTQxMWYtOGEyOC04NGY0Mzc2ODg1OGUiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLfffCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6IjE0TklNVUVaNWtlU0F6bWtGOEMzQUEiLCJ2ZXIiOiIyLjAifQ.bpKZYbXGfxfyLZW9BM1JskuiiDXbUSwAawMJ-C6cFXLhRKAH8CWOeHor-5azI8TcXHskjHKOUvUwBg0cKkcb2f_7qACS0HxKNqvzTWcVEapsg-37fI0gz2zB9xg7XGUZPbSmgkplS9yB-AkEhTbGB8PJywUQYZ1D2_rBzFxwr2bvOaiAAANdj2mD9jcT72auZIOAjTHpFOKuaQyoQNHe_xnVokY2kL2Uv76uQujWGNZscfLfjWtQJrJaxCqFi4TudpqsxTdktagL-M--3sBZj-nyAGAZceiLH35Cmijf_9-EW4dcrtQ9V0-LAJ4_l_e9g1UqDnFHSuUtwA_MZwHt-T";
    return this;
  }

  Dio create() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }
}

extension Builder on Dio {
  ApiClientBuilder newBuilder() {
    ApiClientBuilder builder = ApiClientBuilder();
    builder.dio = this;
    return builder;
  }
}
