import 'dart:convert';

import 'package:http/http.dart' as http;

const BASE_URL = "http://10.0.2.2:3000";

enum ENDPOINTS {
  CREATE_MERCHANT,
  GET_ALL_MERCHANTS,
  GET_MERCHANT
}

String getEndpoint(ENDPOINTS endpoint) {
  switch(endpoint) {
    case ENDPOINTS.CREATE_MERCHANT:
      return "${BASE_URL}/merchants/new";
    case ENDPOINTS.GET_ALL_MERCHANTS:
      return "${BASE_URL}/merchants";
    case ENDPOINTS.GET_MERCHANT:
      return "${BASE_URL}/merchants/search";
    default:
      return BASE_URL;
  }
}
Future handlePost(body) => http.post(
  getEndpoint(ENDPOINTS.CREATE_MERCHANT),
  body: jsonEncode(body),
  headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
);