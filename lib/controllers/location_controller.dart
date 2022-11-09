import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:iWarden/models/location.dart';
import 'package:http/http.dart' as http;

final serviceURL = dotenv.get(
  'SERVICE_URL',
  fallback: 'http://192.168.1.200:7003',
);

const jwt =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6IjJaUXBKM1VwYmpBWVhZR2FYRUpsOGxWMFRPSSJ9.eyJhdWQiOiI5ZTAyYzVlZi05ZmFkLTQ2ZTAtYWRjMy1lNjc0Zjc0Mjc5ODciLCJpc3MiOiJodHRwczovL2xvZ2luLm1pY3Jvc29mdG9ubGluZS5jb20vMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxL3YyLjAiLCJpYXQiOjE2Njc5NzgwOTMsIm5iZiI6MTY2Nzk3ODA5MywiZXhwIjoxNjY3OTgxOTkzLCJhaW8iOiJBVFFBeS84VEFBQUEzSk1JSVlZUWpKVXJLdDdiVGdCSWRtTHMvci92ZEN3WUJOenE1ZlV2TEdRYlRqOS9rcFUzcGU2SEd3MzVhUnM0IiwibmFtZSI6IktpbSBWdW9uZyIsIm5vbmNlIjoiOGIzN2M3YWYtM2RiYi00ODgzLTgzMWUtMThjZWU1M2ExZDFiIiwib2lkIjoiZTQ1OWYzNWMtOGM3NC00NWZlLWI2MzctZWZlNWE4NDY3YThjIiwicHJlZmVycmVkX3VzZXJuYW1lIjoia2ltLnZ1b25nQHVrcGFya2luZ2NvbnRyb2wuY29tIiwicmgiOiIwLkFWNEF1YnFyQzJFbDhFaWwzZ3RLeGtjNVVlX0ZBcDZ0bi1CR3JjUG1kUGRDZVlkZUFMay4iLCJzdWIiOiJNZU91SjN4dGZwZTlEWjlCaEdhWnY5bnFLeGNYQnBrYkV6TEozOWx6V1JnIiwidGlkIjoiMGJhYmJhYjktMjU2MS00OGYwLWE1ZGUtMGI0YWM2NDczOTUxIiwidXRpIjoiY2xLVURLTTlrMEs3ekluNU00aWZBQSIsInZlciI6IjIuMCJ9.LztybELWFzL-NSsZTmuXJAK0elveEWPjk3jZEEd1lRebonG2mDLC1b1hcJunGa7v8z1hRkoY8NqItCxwty9-PFPB5Qbv_ORRDwbdKqFIbhfDHD2wykNDSzPDajVpMiHu83JbCrhUZTOYMasHS9tka_eaGPo7_-1vYmq1XwA5WXIYqx6oefcePC1MwrXmW7ORZ1AL5KS0XpG_nY-GE3HTJs8_mu_gc2pGo-zn6JFqfhug0scYs1-pL2Kl5xMkydcJd9y-Hz9IghMx6GnxQ-4wanRqrjJKJCDKtGsl3W0-iVpnAX48vwd-kD7YKDCxDnlrdw8Q7zy95aCYzWFzRFvDhg';

class LocationController {
  // static List<Location> parseLocation(String responseBody) {
  //   var list = jsonDecode(responseBody) as List<dynamic>;
  //   List<Location> locations =
  //       list.map((model) => Location.fromJson(model)).toList();
  //   return locations;
  // }

  Future<List<LocationWithZones>> getAll() async {
    try {
      final response = await http.get(
        Uri.parse('$serviceURL/location/location-of-the-day-by-warden/2'),
        headers: {
          "Authorization": jwt,
          'Content-Type': 'application/json',
        },
      );

      final responseData = jsonDecode(response.body);
      log(responseData[0]['Id'].toString());
      return responseData;
      // return compute(parseLocation, response.body);
    } catch (error) {
      rethrow;
    }
  }
}
