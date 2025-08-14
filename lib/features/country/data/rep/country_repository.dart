import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

import 'package:flutter_hiring_test_djy/features/country/data/models/country.dart';

import '../source/country_data_source.dart';

final countryRepository = CountryRepository(CountryRemoteDataSource(Dio()));

abstract class ICountryRepository {
  Future<List<Country>> getCountries();
}

class CountryRepository implements ICountryRepository {
  static final ValueNotifier<List<Country>?> countriesNotifier = ValueNotifier(null);

  final CountryRemoteDataSource dataSource;

  CountryRepository(this.dataSource);

  @override
  Future<List<Country>> getCountries() async {
    final List<Country> countries = await dataSource.getCountries();
    countriesNotifier.value = countries;
    return countries;
  }
}

//Use Case
class GetCountries {
  final ICountryRepository repository;

  GetCountries(this.repository);

  Future<List<Country>> call() async {
    return await repository.getCountries();
  }
}
