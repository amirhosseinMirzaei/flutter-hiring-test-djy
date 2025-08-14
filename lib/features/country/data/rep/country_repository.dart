import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import '../models/country.dart';
import '../source/country_data_source.dart';
import '../../../../core/error/failure.dart';

final countryRepository = CountryRepository(CountryRemoteDataSource(Dio()));

abstract class ICountryRepository {
  Future<List<Country>> getCountries();
}

class CountryRepository implements ICountryRepository {
  // نگهداری لیست کشورها برای UI
  static final ValueNotifier<List<Country>?> countriesNotifier = ValueNotifier(null);

  final CountryRemoteDataSource dataSource;

  CountryRepository(this.dataSource);

  @override
  Future<List<Country>> getCountries() async {
    try {
      final List<Country> countries = await dataSource.getCountries();
      countriesNotifier.value = countries;
      return countries;
    } on Failure catch (f) {
      throw f;
    } catch (e) {
      throw Failure.server('خطای ناشناخته در Repository: ${e.toString()}');
    }
  }
}
