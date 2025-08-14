import '../../data/models/country.dart';
import '../../data/rep/country_repository.dart';


class GetCountries {
  final ICountryRepository repository;

  GetCountries(this.repository);

  Future<List<Country>> call() async {
    return await repository.getCountries();
  }
}