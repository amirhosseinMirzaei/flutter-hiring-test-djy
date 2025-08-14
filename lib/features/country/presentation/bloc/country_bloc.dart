import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecase/FetchCountries.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountries getCountries;

  CountryBloc(this.getCountries) : super(const CountryState.initial()) {
    on<CountryEvent>((event, emit) async {
      await event.when(
        getCountries: () async {
          emit(const CountryState.loading());
          try {
            final countries = await getCountries();
            emit(CountryState.loaded(countries));
          } catch (e) {
            if (e is Failure) {

              emit(CountryState.error(e));
            } else {
              emit(CountryState.error(Failure.server('خطای ناشناخته')));
            }
          }
        },
      );
    });
  }
}
