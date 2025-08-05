import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_3/slider_provider.dart';

class SliderHomeSateLessScreen extends ConsumerWidget {
  const SliderHomeSateLessScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final sliderValue = ref.watch(sliderProvider);
    debugPrint('build1: ${DateTime.now().second}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Slider App (Stateful)'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),

      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            // Eye Button
            Consumer(
              builder: (context, ref, child) {

                final sliderValue = ref.watch(sliderProvider);
                debugPrint('build4: ${DateTime.now().second}');

                return IconButton(
                    onPressed: () {
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state = stateProvider.state.copyWith(isShowButton: !sliderValue.isShowButton);
                    },
                    icon: Icon(sliderValue.isShowButton? Icons.visibility : Icons.visibility_off, size: 50)
                );
              }
            ),

            // Color Container
            Consumer(builder: (context, ref, child) {
              
              final sliderValue = ref.watch(sliderProvider);
              debugPrint('build2: ${DateTime.now().second}');
              
              return Opacity(
                opacity: sliderValue.sliderDoubleValue,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                ),
              );
            }),
            SizedBox(height: 10.0),

            // Slider Controller
            Consumer(builder: (context, ref, child) {

              final sliderValue = ref.watch(sliderProvider);
              debugPrint('build3: ${DateTime.now().second}');
              
              return Slider(
                  value: sliderValue.sliderDoubleValue,
                  onChanged: (value){
                    // ref.read(sliderProvider.notifier).state.sliderDoubleValue = value;
                    final stateProvider = ref.read(sliderProvider.notifier);
                    stateProvider.state = stateProvider.state.copyWith(sliderDoubleValue: value);
                  }
              );
            })
          ],
        ),
      ),

    );
  }
}
