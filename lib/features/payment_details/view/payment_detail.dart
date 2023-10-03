import 'package:dating_assitant_app/commons/utils/colors.dart';
import 'package:dating_assitant_app/commons/widgets/button_widget.dart';
import 'package:dating_assitant_app/commons/widgets/text_widgets.dart';
import 'package:dating_assitant_app/features/payment_details/widgets/payment_container.dart';
import 'package:dating_assitant_app/features/payment_details/widgets/text_form_field.dart';
import 'package:dating_assitant_app/features/payment_details/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentDetail extends StatelessWidget {
  const PaymentDetail({super.key});

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
        title: const Textsize32(
          text: 'Payment Details',
          color: ProjectColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),
        elevation: 0,
        backgroundColor: ProjectColors.white,
        foregroundColor: ProjectColors.black,
      ),
      backgroundColor: ProjectColors.white,
      // Payment Form
      body: Container(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 60, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    PaymentContainer(
                      imageURL: 'assets/payment_images/visa_logo.png',
                      height: 28,
                      width: 63,
                    ),
                    SizedBox(width: 20),
                    PaymentContainer(
                      imageURL: 'assets/payment_images/mastercard_logo.png',
                      height: 28,
                      width: 48,
                    )
                  ],
                ),
                const SizedBox(height: 40),

                // Name Input
                const FormLabelText(label: 'Name'),
                const SizedBox(height: 5),
                const CustomTextFormField(),
                const SizedBox(height: 30),

                // Card Input
                const FormLabelText(label: 'Card Number'),
                const SizedBox(height: 5),
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(height: 30),

                // Card Expiry date & Cvv Input
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabelText(label: 'Expiry Date'),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          width: 150,
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    ),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const FormLabelText(label: 'Cvv'),
                        const SizedBox(height: 5),
                        CustomTextFormField(
                          width: 150,
                          hintText: 'CVV',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            appButton(
              onTap: () {},
              buttonTitle: 'Pay',
            )
          ],
        ),
      ),
    );
  }
}
