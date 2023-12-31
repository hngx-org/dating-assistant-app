import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordObscure = StateNotifierProvider.autoDispose<ObscureNotifier,bool>((ref) {
  return ObscureNotifier();
});

class ObscureNotifier extends StateNotifier<bool> {
  ObscureNotifier():super(true);

  void toggle() {
    state = !state;
  }
}