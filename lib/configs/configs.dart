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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njg5OTU0ODksIm5iZiI6MTY2ODk5NTQ4OSwiZXhwIjoxNjY4OTk5Mzg5LCJhaW8iOiJBVFFBeS84VEFBQUE0bHZuaVQ0Mmt4SzluMDhoeXRrN1FDN1NXWG9rWnVKc29HQ1hpaVcyYnFZK1dKRnVvNzhKSVNsUTQ4LzRIWWcvIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiI2MWRjMjdmYi0zNTA3LTQ5ZWItYjhiYi0wMjkyNWRiNWVmNDYiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6Im5rMnU2UmVjUms2WGlpTUh3dzRyQUEiLCJ2ZXIiOiIyLjAifQ.IUr5E-iPj21UH18jHAu4j3xVSskqPPPokBoWjeLR24sNaMqWDut9eQXnZs5FowwOkxi1wQi4vSEJ8No4v3Q9f5UJq8rkI41xmeG7DrMRoNtLPr2YuZJVNSL2362r3jFEsopAQ07klyP64O5BVyovDzuTkAmlHqoNHYGW9R5kgnyd0VXr1Jp7TulVpp4iF8jzulHFxwE8c5ev4FQN6hzN-bwT5cKlhNdTSlm8eBiy8bvf6wJYki3xq_hT6fF96TBCMtdr3Ly6upRz23k_Z2ylmvieIxwHlH16FuD1TGm-12v36gtDbckALKI95eEzMqfuzH2y7fJCtPhQMjCgUuGJ5A';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
