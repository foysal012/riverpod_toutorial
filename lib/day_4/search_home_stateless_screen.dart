import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_4/search_provider.dart';

class SearchHomeStatelessScreen extends ConsumerWidget {
  const SearchHomeStatelessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final searchString = ref.watch(searchProvider);
    debugPrint('build1: ${DateTime.now().second}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Search App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(
                builder: (context, ref, child) {

                  debugPrint('build4: ${DateTime.now().second}');
                  final searchString = ref.watch(searchProvider.select((value) => value.isSearched));
                  return Switch(
                      value: searchString,
                      onChanged: (value) {
                        ref.read(searchProvider.notifier).onChange(onChange: value);
                      },
                  );
                }
            ),
            SizedBox(height: 10.0),

            Consumer(
              builder: (context, ref, child) {

                debugPrint('build2: ${DateTime.now().second}');

                return TextField(
                  onChanged: (value) {
                    ref.read(searchProvider.notifier).searchText(query: value);
                  },
                );
              }
            ),
            SizedBox(height: 10.0),
            
            Consumer(
              builder: (context, ref, child) {

                final searchString = ref.watch(searchProvider.select((value) => value.searchValue));
                debugPrint('build3: ${DateTime.now().second}');

              return Text('${searchString}');
            })
          ],
        ),
      ),
    );
  }
}
