import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/country_bloc.dart';
import '../bloc/country_event.dart';
import '../bloc/country_state.dart';
import '../widgets/country_shimmer_item.dart';

class CountryListPage extends StatelessWidget {
  final CountryBloc countryBloc;

  const CountryListPage({super.key, required this.countryBloc});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Countries')),
        body: BlocProvider.value(
          value: countryBloc,
          child: BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Press button to load')),
                loading: () => ListView.builder(itemCount: 20, itemBuilder: (_, __) => const CountryShimmerItem()),
                loaded:
                    (countries) => ListView.builder(
                      itemCount: countries.length,
                      itemBuilder: (context, index) {
                        final country = countries[index];
                        return RepaintBoundary(
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: country.flag,
                              width: 50,
                              height: 30,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const SizedBox(width: 10, height: 10, child: CircularProgressIndicator(strokeWidth: 1)),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                            title: Text(country.name),
                            subtitle: Text(country.capital),
                          ),
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
      ),
    );
  }
}
