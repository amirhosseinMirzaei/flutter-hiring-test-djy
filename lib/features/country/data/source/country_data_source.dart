import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/country.dart';

abstract class ICountryRemoteDataSource {
  Future<List<Country>> getCountries();
}

class CountryRemoteDataSource implements ICountryRemoteDataSource {
  final Dio httpClient;

  CountryRemoteDataSource(this.httpClient);

  @override
  Future<List<Country>> getCountries() async {
    final response = await httpClient.get('https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json');

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.data);
      return jsonList.map((e) => Country.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
