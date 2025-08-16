import 'package:flutter_riverpod/flutter_riverpod.dart';

// final futureProvider = FutureProvider<int>((ref) async{
//   await Future.delayed(Duration(seconds: 3));
//   // throw 'No Internet Connection';
//   return 3;
// });

final futureProvider = FutureProvider<List<String>>((ref) async{
  await Future.delayed(Duration(seconds: 3));
  // throw 'No Internet Connection';
  return [
    'Nadim',
    'Nahid',
    'Rahul',
    'Rabbi',
    'Foysal'
  ];
});