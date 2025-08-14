import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';

class CountryListPage extends StatelessWidget {
  final CountryBloc countryBloc;

  const CountryListPage({super.key, required this.countryBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: BlocProvider.value(
        value: countryBloc,
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Press button to load')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (countries) => ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  final country = countries[index];
                  return ListTile(
                    leading: Image.network(
                      country.flag,
                      width: 50,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    title: Text(country.name),
                    subtitle: Text(country.capital),
                  );
                },
              ),
              error: (message) => Center(child: Text('Error: $message')),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countryBloc.add(const CountryEvent.getCountries());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
