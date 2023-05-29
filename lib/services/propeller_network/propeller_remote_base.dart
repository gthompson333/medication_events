import 'dart:convert';
import 'package:http/http.dart';
import 'package:medication_events/services/network_utils.dart';

class PropellerRemoteBase {
  static const String _baseUrl =
      "https://s3-us-west-2.amazonaws.com/ph-svc-mobile-interview-jyzi2gyja";
  final Client _client;

  PropellerRemoteBase(this._client);

  Future<Response> request(
      {required RequestAction action,
      required String path,
      dynamic body = Nothing}) async {
    switch (action) {
      case RequestAction.get:
        return _client.get(Uri.parse("$_baseUrl/$path"));
      case RequestAction.post:
        return _client.post(Uri.parse("$_baseUrl/$path"),
            headers: {"Content-Type": "application/json"},
            body: json.encode(body));
      case RequestAction.delete:
        return _client.delete(Uri.parse("$_baseUrl/$path"));
      case RequestAction.put:
        return _client.put(Uri.parse("$_baseUrl/$path"),
            headers: {"Content-Type": "application/json"},
            body: json.encode(body));
    }
  }
}
