import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_toutorial/day_3/slider_provider.dart';

class SliderHomeStatefulScreen extends ConsumerStatefulWidget {
  const SliderHomeStatefulScreen({super.key});

  @override
  ConsumerState<SliderHomeStatefulScreen> createState() => _SliderHomeStatefulScreenState();
}

class _SliderHomeStatefulScreenState extends ConsumerState<SliderHomeStatefulScreen> {

  // double sliderValue = 0.1;

  @override
  Widget build(BuildContext context) {

    // final slider = ref.watch(sliderProvider);
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

                final slider = ref.watch(sliderProvider.select((value) => value.isShowButton));
                debugPrint('build4: ${DateTime.now().second}');

                return IconButton(
                    onPressed: () {
                      final stateSlider = ref.read(sliderProvider.notifier);
                      stateSlider.state = stateSlider.state.copyWith(isShowButton: !slider);
                    },
                    icon: Icon(slider? Icons.visibility : Icons.visibility_off, size: 50)
                );
              }
            ),
            SizedBox(height: 10.0),

            // Color Container
            Consumer(builder: (context, ref, child) {

              final slider = ref.watch(sliderProvider.select((value) => value.sliderDoubleValue));
              debugPrint('build2: ${DateTime.now().second}');

              return Opacity(
               opacity: slider,
               child: Container(
                 height: 200,
                 width: 200,
                 decoration: BoxDecoration(
                   color: Colors.cyan,
                 ),
               ),
             );
            }),
            SizedBox(height: 10.0),

            // Slider Controller
            Consumer(builder: (context, ref, child) {

              final slider = ref.watch(sliderProvider.select((value) => value.sliderDoubleValue));
              debugPrint('build3: ${DateTime.now().second}');

              return Slider(
                  value: slider,
                  onChanged: (value) {
                    final stateSlider = ref.read(sliderProvider.notifier);
                    stateSlider.state = stateSlider.state.copyWith(sliderDoubleValue: value);
                  }
              );
            })

          ],
        ),
      ),
    );
  }
}
