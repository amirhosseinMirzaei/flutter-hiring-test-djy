import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_event.freezed.dart';

@freezed
class CountryEvent with _$CountryEvent {
  const factory CountryEvent.getCountries() = _GetCountries;
}
