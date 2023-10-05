import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/features/application/views/dashbord.dart';
import 'package:dating_assitant_app/features/terms&conditions/widgets/conditions_text_widget.dart';
import 'package:flutter/material.dart';

import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/checkbox_provider.dart';

class TermsCheckbox extends ConsumerWidget {
  const TermsCheckbox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkboxProvider);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  ref.read(checkboxProvider.notifier).toggle();
                },
              ),
              const Text('I accept the terms and conditions'),
            ],
          ),
          const SizedBox(height: 30),
          appButton(
            onTap: () {
              if (isChecked) {
                // If the checkbox is checked, display an alertdialog.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const ConditionText(
                        text: 'Success',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      content: const ConditionText(
                        text: 'You accepted the terms and conditions.',
                        fontWeight: FontWeight.w500,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Dashboard(),
                              ),
                            );
                          },
                          child: const ConditionText(
                            text: 'OK',
                            fontWeight: FontWeight.w600,
                            color: ProjectColors.pink,
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                // If the checkbox is not checked.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const ConditionText(
                        text: 'Sorry',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      content: const ConditionText(
                        text: 'Please accept the terms and conditions.',
                        fontWeight: FontWeight.w500,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const ConditionText(
                            text: 'OK',
                            fontWeight: FontWeight.w600,
                            color: ProjectColors.pink,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            buttonTitle: 'Submit',
          )
        ],
      ),
    );
  }
}
