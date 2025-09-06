import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_10/family_provider.dart';

class FamilyStatelessHomeScreen extends ConsumerWidget {
  const FamilyStatelessHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final provider = ref.watch(multiProvider(120));
    Map<String, dynamic> map = {
      "id" : 10
    };
    final provider = ref.watch(multiProvider(map));
    return Scaffold(
      appBar: AppBar(
        title: Text('Family Provider App (Stateless)'),
        centerTitle: true,
        backgroundColor: Colors.indigo[200],
      ),
      
      body: Container(
        child: Center(child: Text('${provider.toString()}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.black
          ),
        )),
      ),
    );
  }
}
