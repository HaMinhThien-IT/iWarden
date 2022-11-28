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
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njk2MTk2NTksIm5iZiI6MTY2OTYxOTY1OSwiZXhwIjoxNjY5NjIzNTU5LCJhaW8iOiJBVFFBeS84VEFBQUFQb09UakFmVFNoSzFGN0hid2NVeExOWXE5OCtJNGRjemxvWmpuNTdwaldnbkVLZndTcUs5ZWJzL1I5ZS9kV0hXIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiI5NTQ0MTIyOS0xYzY2LTRkNmYtYTY3NS1lZjQxYjgwMmFmYjEiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6IkN0SVJ1UkpRakV1dlVqVHJyX1g1QUEiLCJ2ZXIiOiIyLjAifQ.BBcTu6I4BH7X9sRL5Z546xxKmwyb5RR37Rypwhmgxi_q1XyN4RvFnNsRh2W0-m6H_F0B0AsFvtoZaIAK_hES1ei4NX92sdKRig1EXi1lc4Bsrx2tjPI0sQtnAQFXcDXKEp5qn1bNahSbw4JmNWpjXE3xpAc0ciDkioQnHNCI6OlxcewV783jz8IChAiSvONcFmebOgC01lDc-GaiYEvzS-NM38tt2AnwZjToLipCPEWclpvDJiIqPwl5LQ1hCfhzjmx099A1CJxJZbqQTtyc8sAunE4Hj6RXyFUSoWZ6n6fNJ5hBEbgojCxCPzmLkBNAz4_MiPiDupyei-w3WnfQZw";
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
