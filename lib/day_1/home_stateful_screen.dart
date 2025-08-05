import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final name = Provider<String>((ref) {
  return 'Foysal Joarder';
});

final age = Provider<int>((ref) {
  return 25;
});

final gender = Provider<String>((ref) {
  return 'Male';
});

class HomeStatefulScreen extends ConsumerStatefulWidget {
  const HomeStatefulScreen({super.key});

  @override
  ConsumerState<HomeStatefulScreen> createState() => _HomeStatefulScreenState();
}

class _HomeStatefulScreenState extends ConsumerState<HomeStatefulScreen> {
  @override
  Widget build(BuildContext context) {
    final tempName = ref.watch(name);
    final tempAge = ref.watch(age);
    final tempGender = ref.watch(gender);
    return Scaffold(
      appBar: AppBar(title: Text('Home Stateful Screen'), centerTitle: true),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tempName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '$tempAge',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              tempGender,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
