import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hoonyDev/screen/main/fab/w_floating_daangn_button.state.dart';



final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);


  void onTapButton() {
    state = state.copyWith(isExpanded: !state.isExpanded, isSmall: true);
  }

  void changeButtonSize(bool isSmall) {
    state = state.copyWith(isSmall: isSmall);
  }
}

