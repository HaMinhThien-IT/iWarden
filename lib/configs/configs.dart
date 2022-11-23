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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2NjkxOTE2MzAsIm5iZiI6MTY2OTE5MTYzMCwiZXhwIjoxNjY5MTk1NTMwLCJhaW8iOiJBVFFBeS84VEFBQUFoSE9sdkhsbVFQYkp3UWFtdUtuMDZvb0xHeTVhT3hDZERzTU4wN3FNNHRlR2o4RmRzYTYxWEYra01KVExoVVRyIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiIwYjlmZjI4OS1hNjM4LTQ1ZjEtYWZjZi1mZDIyN2MwOTQ1MWEiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6Il8wbTZFb052aVVTTEdSUkNGVlN3QUEiLCJ2ZXIiOiIyLjAifQ.HDmEaskHqeMZZYKq3n2xgcjtxsJFE0dxMyVb4CUjXZPzv59c9E4bGy0M0arKabRDi6pxk_JE8EqMT4dlSK35jLtwNXduGLgrjQdLwHi1yA0OS1ipzmlhcHQ-yXCUE-J-OoJkjbI7VjUv2d0_gSBATkg8OlgE6Nr3OIxYAnLsLzDleavXieYP9TIrBQCq0HyFDUGq8z7fmCWaq5KOE8y3WBDuskEyMqsfI9nUluv92rsArCZzrTyaH3hs5kq3UF0U2I1cNKHErzy-TyHYRRpGEaZdEGSC8Yhs6dkcInSJGw1E1MNRuNvCFK8P3Gav3A5QAWySwChecFM-NItirIqTCQ';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
