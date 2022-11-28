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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njk1MjIwODksIm5iZiI6MTY2OTUyMjA4OSwiZXhwIjoxNjY5NTI1OTg5LCJhaW8iOiJBVFFBeS84VEFBQUFqUjVjMEE3WFdlSUpzYldYYnJVSnFPaU4rUEl1Ym5GOVU3SDlCb1JYcDJRczA3R0FITkVRQWxGN25oV3dWU0tTIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiIzZmY2OTRiZC02ZDMzLTQ0MjYtODYzYi03ZmRhYWM2ZGQzZTciLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6IjVUSTdKVXZXcjBHeEgyeTlOaU1tQUEiLCJ2ZXIiOiIyLjAifQ.khhFAeuMd_V-Rl7mndeNOpMqo29jSoZ5ngQgLMzBWaJ2RDff_dx4SRBAbJitIom84z9CV8jfH4V9REKuJWvJ5J_Q10-gFvQ3ZcX-fBbNOupz-_42d928TV3gup2mfOP5KWk72IKygrKXHqzJbVvGEnFzyX9ezYs_veEwFVedtH1SxHHXR3H_MWhPU1bh5P9i8Zm9CmC6N5DqCwOmcOk8-erll4aKJZgouXH6_sD2v68VcNx_6VcN0ZhbiBxP-ahm6GtQh2bBkwDVdk3y1chjGZwUl9yCaeYQkQd0sfOIPV9UjjOLoQGuDGP-yx14jPSVk0r5Kian5L62bt5vWoTiRQ';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
