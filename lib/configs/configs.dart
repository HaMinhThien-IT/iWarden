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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njk0MzE5MzUsIm5iZiI6MTY2OTQzMTkzNSwiZXhwIjoxNjY5NDM1ODM1LCJhaW8iOiJBVFFBeS84VEFBQUFESkg3MG9VQnZjdmdOMDY2ZE1uN1dLVTJjcWJ3YjNrV3hzRGE0TWw5bVZlYktiWHMxWDl6bEdlaU9sTHNBSXN6IiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiJhZGYyZDMyNS1hOWZjLTQ2MGItOWI4NC1iNDY3Y2Y3MGU0OTEiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6Inh3WXg4V0Y1R0VPNmlRZEZYZjk1QVEiLCJ2ZXIiOiIyLjAifQ.ewBgP9gSUSaPXGb4gAg8zulhrO9SLSz9JxX_QtBzTsdHJfHFKOnFvyHEzh0OpAQkQ8mGkMOTvSntXq9Hw98zlG_dMRV8vdBgdjPLdaqyEYjkHWqF2-QmU7UKcoVBy4yFs1gr5JgZdMaavaVGtKdX_jmyO0lNxp8wC0vdxsD5Wd9JM2rSXfAHPjICduHKY99lH2AVGIo2A_YOdwRkhRK7h7_gLqTIM8q8ijpWuTHrX6BZFjvZ7zeWipJM6IooMqu9qFi74JjSxtdSjvGjtWsDglDRuGlgz2C3nE9tqFb-sy62Z10tFOiAbjrv8avixt0pH4g2oUCLmPvT75FwBetS7A';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
