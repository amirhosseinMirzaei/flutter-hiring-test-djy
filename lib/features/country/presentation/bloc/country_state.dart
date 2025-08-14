import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/country.dart';
import '../../../../core/error/failure.dart';


part 'country_state.freezed.dart';

@freezed
class CountryState with _$CountryState {
  const factory CountryState.initial() = _Initial;
  const factory CountryState.loading() = _Loading;
  const factory CountryState.loaded(List<Country> countries) = _Loaded;
  const factory CountryState.error(Failure failure) = _Error;
}
