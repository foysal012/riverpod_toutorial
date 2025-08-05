import 'package:flutter_riverpod/flutter_riverpod.dart';


final sliderProvider = StateProvider<AppState>((ref) {
  return AppState(
      sliderDoubleValue: 0.5,
      isShowButton: false
  );
});

class AppState{
  double sliderDoubleValue;
  bool isShowButton;

  AppState({required this.sliderDoubleValue, required this.isShowButton});

  AppState copyWith({double? sliderDoubleValue, bool? isShowButton}){
    return AppState(
        sliderDoubleValue: sliderDoubleValue ?? this.sliderDoubleValue,
        isShowButton: isShowButton ?? this.isShowButton
    );
  }
}