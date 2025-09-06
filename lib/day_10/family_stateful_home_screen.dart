import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'family_provider.dart';

class FamilyStatefulHomeScreen extends ConsumerStatefulWidget {
  const FamilyStatefulHomeScreen({super.key});

  @override
  ConsumerState<FamilyStatefulHomeScreen> createState() => _FamilyStatefulHomeScreenState();
}

class _FamilyStatefulHomeScreenState extends ConsumerState<FamilyStatefulHomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
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
