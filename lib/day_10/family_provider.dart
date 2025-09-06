import 'package:flutter_riverpod/flutter_riverpod.dart';

// final multiProvider = StateProvider.family<int, int>((ref, number) {
//   return 6 * number;
// });

final multiProvider = StateProvider.family<int, Map<String, dynamic>>((ref, number) {
  return number["id"] * 6;
});