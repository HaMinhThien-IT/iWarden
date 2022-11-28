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
      'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njk2MTk2NTksIm5iZiI6MTY2OTYxOTY1OSwiZXhwIjoxNjY5NjIzNTU5LCJhaW8iOiJBVFFBeS84VEFBQUFQb09UakFmVFNoSzFGN0hid2NVeExOWXE5OCtJNGRjemxvWmpuNTdwaldnbkVLZndTcUs5ZWJzL1I5ZS9kV0hXIiwibmFtZSI6IkJhbmcgTmd1eWVuIiwibm9uY2UiOiI5NTQ0MTIyOS0xYzY2LTRkNmYtYTY3NS1lZjQxYjgwMmFmYjEiLCJvaWQiOiI4MmFhYmEyYy1mZWFmLTQ1ODMtYWQ0Yy04Y2U5YmQwNzZjZjUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiYW5nLm5ndXllbkB1a3Bhcmtpbmdjb250cm9sLmNvbSIsInJoIjoiMC5BVjRBdWJxckMyRWw4RWlsM2d0S3hrYzVVZV9GQXA2dG4tQkdyY1BtZFBkQ2VZZGVBQ00uIiwic3ViIjoiNTdJY21vY0hVZ2ExUFZETlBSNEFDQUFKQV81eUZXcWxSUHVfLUVFUDlEUSIsInRpZCI6IjBiYWJiYWI5LTI1NjEtNDhmMC1hNWRlLTBiNGFjNjQ3Mzk1MSIsInV0aSI6IkN0SVJ1UkpRakV1dlVqVHJyX1g1QUEiLCJ2ZXIiOiIyLjAifQ.BBcTu6I4BH7X9sRL5Z546xxKmwyb5RR37Rypwhmgxi_q1XyN4RvFnNsRh2W0-m6H_F0B0AsFvtoZaIAK_hES1ei4NX92sdKRig1EXi1lc4Bsrx2tjPI0sQtnAQFXcDXKEp5qn1bNahSbw4JmNWpjXE3xpAc0ciDkioQnHNCI6OlxcewV783jz8IChAiSvONcFmebOgC01lDc-GaiYEvzS-NM38tt2AnwZjToLipCPEWclpvDJiIqPwl5LQ1hCfhzjmx099A1CJxJZbqQTtyc8sAunE4Hj6RXyFUSoWZ6n6fNJ5hBEbgojCxCPzmLkBNAz4_MiPiDupyei-w3WnfQZw';

  static final headers = {
    "Authorization": jwt,
    'Content-Type': 'application/json',
  };
}
