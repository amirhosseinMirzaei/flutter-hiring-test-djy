import 'dart:convert';
import 'package:flutter_hiring_test_djy/features/country/data/models/country.dart';
import 'package:flutter_hiring_test_djy/features/country/data/source/country_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import 'country_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late CountryRemoteDataSource dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = CountryRemoteDataSource(mockDio);
  });

  final tCountryJson = {"name": "ایران", "capital": "تهران", "code": "IR", "flag": "https://flagcdn.com/w320/ir.png"};

  final tCountry = Country.fromJson(tCountryJson);

  test('should return list of countries when response is 200', () async {
    // mock موفق با statusCode 200
    when(mockDio.get<String>(any)).thenAnswer(
      (_) async => Response(
        data: jsonEncode([tCountryJson]), // داده به صورت String
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getCountries();

    expect(result, [tCountry]);
  });

  test('should throw Exception when response status is not 200', () async {
    // mock با statusCode غیر 200
    when(mockDio.get<String>(any)).thenAnswer((_) async => Response(data: 'Error', statusCode: 404, requestOptions: RequestOptions(path: '')));

    expect(() async => await dataSource.getCountries(), throwsA(isA<Exception>()));
  });
}
