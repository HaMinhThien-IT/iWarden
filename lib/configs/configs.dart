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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2NjkyNTY5MjIsIm5iZiI6MTY2OTI1NjkyMiwiZXhwIjoxNjY5MjYwODIyLCJhaW8iOiJBVFFBeS84VEFBQUFFMnN6WkxaRVRkZndSOHhpdmdwVHh2RUtBUlBMRXVwMnZHWWFGTFo2Vlp4SUlQcUNSdmpZMXZBWTlLL0lrWXlLIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiJkNDlhYTk3OC0zYzA3LTQ1ZDItODFhNS1mYzUxMzBiNzM0NDIiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6IlVpbzc5MWxNSUUtQWZSOUNJMnV3QUEiLCJ2ZXIiOiIyLjAifQ.OOrvr3nI1qaQqSjCByx6UlOI_6yTkezzSSrH25hx-IkGOrfjUUGCM6oPJhXnNZE-Hr5_y3QwMVlF_WZ7mpyDzi3_Djp-6hoRGG8_xqeUe0F1o-7VzBSlwexBVuE1QFqCKUK3Vs-YqGyEJhYYQNRT1c6RNI4obJi-jBSzaeidVyQpNp4OTgAFunAOGanQsQUF5db25sXax2rkmAb_wTXlXx32CSBOU4SrzQwVhH8ixtMV-nMoIMz1izxwNwIP9FvXrKsNJ0tMhUvcqAZxRFk7vnkg6GjaYkJ4GLliWpqgR6UaRiPFLgk5CsgdukC7DmFwjlA8LBxP69cJZuHGzdxKlQ';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
