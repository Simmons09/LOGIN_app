import 'dart:convert';
import 'package:delivery/src/api/enviroment.dart';
import 'package:delivery/src/models/response_api.dart';
import 'package:delivery/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  String _url = Enviroment.API_DELIVERY;
  String _api = "/api/users";
  BuildContext? context;
  Future? init(BuildContext context) {
    this.context = context;
  }

  Future<ResponseApi> create(User user) async {
    try {
      Uri url = Uri.http(_url, '$_api/create');
      String bodyParams = json.encode(user);
      Map<String, String> header = {'Content-type': 'application/json'};
      final res = await http.post(url, headers: header, body: bodyParams);
      final data = json.decode(res.body);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      Map<String, bool> header = {'error': false};
      return ResponseApi.fromJson(header);
    }
  }
}
