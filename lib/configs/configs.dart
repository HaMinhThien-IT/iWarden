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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2NjkxNzA1MDksIm5iZiI6MTY2OTE3MDUwOSwiZXhwIjoxNjY5MTc0NDA5LCJhaW8iOiJBVFFBeS84VEFBQUFNempKSWQ1SXMyNFpCdFQweWxRaDIxN3pLUk0vRUNTTngvMHVNRFh0Ny9BalZ1d3R1RzBVeDJud1IzY0phTE9TIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiIwYjlmZjI4OS1hNjM4LTQ1ZjEtYWZjZi1mZDIyN2MwOTQ1MWEiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6ImFta3BDOWxld0VHVDg4U0hGXzMzQUEiLCJ2ZXIiOiIyLjAifQ.PVtbMLESEwTyFxKY38qKMFMyYc2WxcGALe2BCvUjP7ZVVPSu17yS5b2g8nlMzEa8P4sk_1uNhgH21mDfR2H4yooefPHn43dAH19EvwzKBbOM5NBCdv3269hUicIdFnJHzxE25_G4Wc3lOAOGhoBX4An5QFSDNHVMLfdhGc_g7UbIshjsZjTNB0wQMWY_BOie6Mr0vOxIFBMvE4-DJZqnZdFEOtIk-6_S00eTTBLW8mw6NzATljavUQBbJUuQNj0mA8J9VWJf93Co5D1DjvTACacHz93-BkgP6jrlId1o8jIyjgkbVOz_zmvJ4HMq2IVYDts4lfKn45Kg34QwiIMnjA';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
