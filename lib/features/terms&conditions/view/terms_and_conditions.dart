import 'package:flutter/material.dart';

import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/terms&conditions/widgets/checkbox.dart';
import 'package:dating_assitant_app/features/terms&conditions/widgets/conditions_text_widget.dart';

class TermsAndConditons extends StatelessWidget {
  const TermsAndConditons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: ProjectColors.black,
          ),
        ),
        backgroundColor: ProjectColors.white,
        elevation: 0,
      ),
      backgroundColor: ProjectColors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextSize18(
                  text: 'Terms and Conditions',
                  color: ProjectColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              // Terms & Conditions
              ConditionText(
                text:
                    'By using the Dating Assistant app, you agree to the following: ',
              ),
              SizedBox(height: 20),
              ConditionText(
                text:
                    '1. User Eligibility: You must be at least 18 years old to use this app.',
              ),
              SizedBox(height: 20),
              ConditionText(
                text:
                    '2. Privacy: We respect your privacy.  Your data is securely stored and will not be shared without your consent.',
              ),
              SizedBox(height: 20),
              ConditionText(
                text:
                    '3. Appropriate Behavior Be respectful and kind in your interactions. Offensive or harmful behavior will not be tolerated.',
              ),
              SizedBox(height: 20),
              ConditionText(
                text:
                    '4. Use at Your Own Risk: We provide suggestions but do not guarantee any specific outcomes in your dating experience.',
              ),
              SizedBox(height: 20),
              ConditionText(
                text:
                    '5. Account Termination: We reserve the right to terminate accounts for violations of these terms.',
              ),
              // Check box
              TermsCheckbox()
            ],
          ),
        ),
      ),
    );
  }
}
