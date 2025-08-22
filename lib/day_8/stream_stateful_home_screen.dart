import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_8/stream_provider.dart';

class StreamStatefulHomeScreen extends ConsumerStatefulWidget {
  const StreamStatefulHomeScreen({super.key});

  @override
  ConsumerState<StreamStatefulHomeScreen> createState() => _StreamStatefulHomeScreenState();
}

class _StreamStatefulHomeScreenState extends ConsumerState<StreamStatefulHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final streamProviderValue = ref.watch(streamProvider);
    debugPrint('Built1 ${DateTime.now()}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Provider App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Consumer(
            builder: (context, ref, child) {

              final streamProviderValue = ref.watch(streamProvider);
              debugPrint('Built2 ${DateTime.now()}');

              return Column(
                children: [
                  streamProviderValue.when(
                      data: (data) {
                        return Text('$data');
                      },
                      error: (error, stackTrace) => Text('Error is ${error.toString()}'),
                      loading: () => CupertinoActivityIndicator()
                  )
                ],
              );
            }
        ),
      ),
    );
  }
}
