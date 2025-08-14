import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../models/country.dart';

abstract class ICountryRemoteDataSource {
  Future<List<Country>> getCountries();
}

class CountryRemoteDataSource implements ICountryRemoteDataSource {
  final Dio httpClient;

  CountryRemoteDataSource(this.httpClient);

  @override
  Future<List<Country>> getCountries() async {
    try {
      final response = await httpClient.get('https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.data);
        return jsonList.map((e) => Country.fromJson(e)).toList();
      } else {
        throw Failure.server('خطای سرور: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Failure.network('اینترنت وصل نیست یا ارتباط برقرار نمی‌شود');
    } catch (e) {
      throw Failure.cache('خطای کش یا پردازش داده‌ها');
    }
  }
}
