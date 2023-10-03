import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordObscure = StateNotifierProvider<ObscureNotifier,bool>((ref) {
  return ObscureNotifier();
});

class ObscureNotifier extends StateNotifier<bool> {
  ObscureNotifier():super(false);

  void toggle() {
    state = !state;
  }
}