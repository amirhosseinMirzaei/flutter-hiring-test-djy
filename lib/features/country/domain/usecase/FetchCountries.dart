import '../../../../core/error/failure.dart';
import '../../data/models/country.dart';
import '../../data/rep/country_repository.dart';

class GetCountries {
  final ICountryRepository repository;

  GetCountries(this.repository);

  Future<List<Country>> call() async {
    try {
      final countries = await repository.getCountries();
      return countries;
    } on Failure catch (f) {
      throw f;
    } catch (e) {

      throw Failure.server('خطای ناشناخته: ${e.toString()}');
    }
  }
}
