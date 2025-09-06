import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_9/api_provider.dart';

class ApiStatefulHomeScreen extends ConsumerStatefulWidget {
  const ApiStatefulHomeScreen({super.key});

  @override
  ConsumerState<ApiStatefulHomeScreen> createState() => _ApiStatefulHomeScreenState();
}

class _ApiStatefulHomeScreenState extends ConsumerState<ApiStatefulHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final postFuturProvider = ref.watch(postProvider);
    debugPrint('${DateTime.now()}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider App(API) (Statefull)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],
      ),

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: postFuturProvider.when(
            skipLoadingOnRefresh: false,
            data: (data) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final dataInfo = data[index];
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan[100],
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text('${dataInfo.id}')),
                      ),

                      title: Text('${dataInfo.title}',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),

                      subtitle: Text('${dataInfo.body}',
                        style: TextStyle(fontSize: 12, color: Colors.black38),
                      ),

                      trailing: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.cyan[100],
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text('${dataInfo.id}')),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.0);
                  },
                  itemCount: data.length,
              );
            },
            error: (error, stackTrace) {
              // return Text(error.toString());
              return TextButton(
                  onPressed: () {
                  ref.invalidate(postProvider);
              }, child: Text(error.toString()));
            },
            loading: () => CupertinoActivityIndicator(
              radius: 15.0,
              color: Colors.pink,
            )
        ),
      ),
    );
  }
}

