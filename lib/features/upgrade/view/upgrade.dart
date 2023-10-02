import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/custom_container.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/payment_details/view/payment_detail.dart';
import 'package:flutter/material.dart';

class Upgrade extends StatelessWidget {
  const Upgrade({super.key});

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
          color: ProjectColors.white,
          padding:
              const EdgeInsets.only(right: 20, left: 20, top: 70, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Textsize32(
                    text: 'Upgrade to \npremium plan',
                    color: ProjectColors.pink,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    height: 1.5,
                    letterSpacing: 0.5,
                  ),
                  const SizedBox(height: 30),
                  const TextSize18(
                    text:
                        'Enjoy Unlimited access to Dating Assistant, no ads and unique responses from our ai for just \$5 per month',
                    color: ProjectColors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(height: 25),
                  customContainerFilled(
                      containerTitle: '\$ 5 / Month',
                      fontWeight: FontWeight.w700),
                ],
              ),
              appButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PaymentDetail(),
                    ),
                  );
                },
                buttonTitle: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
