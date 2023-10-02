import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkboxProvider = StateNotifierProvider<CheckboxNotifier, bool>((ref) {
  return CheckboxNotifier();
});

class CheckboxNotifier extends StateNotifier<bool> {
  CheckboxNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}
