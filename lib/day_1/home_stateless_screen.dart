import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = Provider<String>((ref) {
  return 'Foysal Joarder';
});

final age = Provider<int>((ref) {
  return 25;
});

class HomeStatelessScreen extends ConsumerWidget {
  const HomeStatelessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final tempName = ref.watch(name);
    final tempAge = ref.watch(age);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Stateless Screen'),
        centerTitle: true,
      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$tempName',
            style: TextStyle(
              fontSize: 18,
            fontWeight: FontWeight.bold,
            ),
            ),
            Text('$tempAge',
            style: TextStyle(
              fontSize: 16,
            fontWeight: FontWeight.w500,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
