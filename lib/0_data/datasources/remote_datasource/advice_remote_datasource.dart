import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  /*
  1- Requests a random advice from the API
  2- returns [AdviceModel] if successfully
  3- throws [ServerException] if status code is not 200
  */
  Future<AdviceModel> getRandomAdviceFromApi();
}

//! implementation here

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'content-type': 'application/json, charset=utf-8'},
    );
    final responseBody = jsonDecode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
