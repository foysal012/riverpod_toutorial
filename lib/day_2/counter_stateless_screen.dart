import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

  final counter = StateProvider<int>((ref) {
    return 0;
  });

  final switchValue = StateProvider<bool>((ref) {
    return false;
  });

class CounterStatelessScreen extends ConsumerWidget {
  const CounterStatelessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final tempCounter = ref.watch(counter);
    debugPrint('build1: ${DateTime.now().second}');
    // final tempSwitchValue = ref.watch(switchValue);

    return Scaffold(
      appBar: AppBar(
          title: Text('Counter App (Stateless)'),
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter value
            Consumer(
                builder: (context, ref, child) {
                  final tempCounter = ref.watch(counter);
                  debugPrint('build2: ${DateTime.now().second}');

                  return Text('${tempCounter}',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    )
                  );
                }
                ),
            SizedBox(height: 10.0),

            // Counter Increment & Decrement button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: (){
                      // if(tempCounter <= 0){
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       SnackBar(
                      //         content: Text('O is the last minimum number. you can not decrease more'),
                      //         duration: Duration(seconds: 1)
                      //       )
                      //   );
                      // } else {
                        ref.read(counter.notifier).state-- ;
                      // }
                    },
                    icon: Icon(Icons.remove_circle, size: 35, color: Colors.red)
                ),
                SizedBox(height: 10.0),

                IconButton(
                    onPressed: (){
                      ref.read(counter.notifier).state++ ;
                    },
                    icon: Icon(Icons.add_circle, size: 35, color: Colors.green)
                ),

              ],
            ),
            SizedBox(height: 10.0),

            // Switch Button
            Consumer(
              builder: (context, ref, child) {
              final tempSwitchValue = ref.watch(switchValue);
              debugPrint('build3: ${DateTime.now().second}');

              return Switch(
                value: tempSwitchValue,
                onChanged: (value) {
                  ref.read(switchValue.notifier).state = value;
                },
              );
            }
            )
          ],
        ),
      ),
    );
  }
}
