import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_7/future_provider.dart';

class FutureStatelessHomeScreen extends ConsumerWidget {
  const FutureStatelessHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    debugPrint('Build1 ${DateTime.now()}');
    // final provider = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Consumer(
            builder: (context, ref, child) {
              debugPrint('Build2 ${DateTime.now()}');
              final provider = ref.watch(futureProvider);
              return Center(
            child: provider.when(
              skipLoadingOnRefresh: false,
              data: (data) => ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Text(data[index].toString(), style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    )
                    );
                  }),
              error: (error, stackTrace) => Text(error.toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  )
              ),
              loading: () => CupertinoActivityIndicator(color: Colors.cyan, radius: 15.0,),
            ),
          );
        })
      ),

      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          debugPrint('Build3 ${DateTime.now()}');
          final provider = ref.watch(futureProvider);
        return FloatingActionButton(
          onPressed: () {
            ref.invalidate(futureProvider);
          },
          child: Icon(Icons.refresh),
        );
      },)
    );
  }
}
