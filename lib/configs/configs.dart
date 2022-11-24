import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final tenantId = dotenv.get(
  'AZURE_TENANT_ID',
  fallback: '0babbab9-2561-48f0-a5de-0b4ac6473951',
);
final clientId = dotenv.get(
  'AZURE_CLIENT_ID',
  fallback: '9e02c5ef-9fad-46e0-adc3-e674f7427987',
);
final redirectUri = dotenv.get(
  'AZURE_REDIRECT_URI',
  fallback:
      'msauth://io.anyline.flutter.examples/gYfucgrOlZ3FLWgYctqk1bCxZbo%3D',
);

class NavigationService {
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class PreferencesKeys {
  static const accessToken = 'access_token';
}

class OAuthConfig {
  static final Config config = Config(
    tenant: tenantId,
    clientId: clientId,
    scope: "openid profile offline_access user.read",
    redirectUri: redirectUri,
    navigatorKey: NavigationService.navigatorKey,
  );
}

class Headers {
  static const jwt =
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2NjkyNTI5ODksIm5iZiI6MTY2OTI1Mjk4OSwiZXhwIjoxNjY5MjU2ODg5LCJhaW8iOiJBVFFBeS84VEFBQUFmV2dualQ4cXlrMFoxT2UxT0M3bXFlZmZLWEs5eXdFVCt6NFhuVFd2d2lOYXhSQ01NRzU2a25Vc0NJN3dlVnAvIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiJjZjFlNTQ5MS1lYmU4LTQ5YTItYjdkYy0xODdhZTljNTNhMzQiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6Il9CSWw4MmswYVUtcF9EYklZTUFYQVEiLCJ2ZXIiOiIyLjAifQ.DXtGtRa18Q4F-aX9eXcAbCDeUP1PJTqwto7RA2zAaNE7NSpPP3fHsP7igSWmHfGuiDkYMyYmGvMLIxYIDTqAoX5x3E-GMFsQXVdTEenXYor4BGTcSkyM2St6OgQqEggDF2cq-BErJ4R5P7ZdIZ4HmUdn7SJMmCJPDkinukUMXMdLWhrnzqX1cvgfaGC-fiYWNBMyJz_WYBMxI8h63xcMEcHnRL-jsxsw_eb8uHr87o78f_i5Kjmspy4vcE9oqONDgMHT_VzsqH6Hfi1VG_pD9n64YJUTGtWCqTVB5HioErkUZEYcms0VRIzfQYBW8bmPTvhFqQapSjkU5xxcP9t3Ig';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
