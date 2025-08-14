import 'package:flutter/material.dart';

import 'features/country/data/rep/country_repository.dart';
import 'features/country/data/source/country_data_source.dart';
import 'features/country/presentation/bloc/country_bloc.dart';
import 'package:dio/dio.dart';

import 'features/country/presentation/pages/country_list_page.dart';

void main() {
  final countryRepository = CountryRepository(CountryRemoteDataSource(Dio()));
  final getCountries = GetCountries(countryRepository);
  final countryBloc = CountryBloc(getCountries);

  runApp(MaterialApp(home: CountryListPage(countryBloc: countryBloc)));
}
