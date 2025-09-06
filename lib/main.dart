import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'day_1/home_stateful_screen.dart';
import 'day_1/home_stateless_screen.dart';
import 'day_2/counter_stateful_screen.dart';
import 'day_2/counter_stateless_screen.dart';
import 'day_3/slider_home_stateless_screen.dart';
import 'day_3/slider_home_stateful_screen.dart';
import 'day_4/search_home_stateful_screen.dart';
import 'day_4/search_home_stateless_screen.dart';
import 'day_5/todo_home_stateless_screen.dart';
import 'day_5/todo_home_stateful_screen.dart';
import 'day_6/favourite_home_stateless_screen.dart';
import 'day_6/favourite_home_stateful_screen.dart';
import 'day_7/future_stateless_home_screen.dart';
import 'day_7/future_stateful_home_screen.dart';
import 'day_8/stream_stateless_home_screen.dart';
import 'day_8/stream_stateful_home_screen.dart';
import 'day_9/api_sateless_home_screen.dart';
import 'day_9/api_stateful_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        // home: HomeStatelessScreen(),
        // home: HomeStatefulScreen(),
        // home: CounterStatelessScreen(),
        // home: CounterStatefulScreen(),
        // home: SliderHomeSateLessScreen(),
        // home: SliderHomeStatefulScreen(),
        // home: SearchHomeStatelessScreen(),
        // home: SearchHomeStatefulScreen(),
        // home: TodoHomeStatelessScreen(),
        // home: TodoHomeStatefulScreen(),
        // home: FavouriteHomeStatelessScreen(),
        // home: FavouriteHomeStatefulScreen(),
        // home: FutureStatelessHomeScreen(),
        // home: FutureStatefulHomeScreen(),
        // home: StreamStatelessHomeScreen(),
        // home: StreamStatefulHomeScreen(),
        // home: ApiSatelessHomeScreen(),
        home: ApiStatefulHomeScreen(),
      ),
    );
  }
}

