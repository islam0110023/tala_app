import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tala_app/core/utils/app_dimensions.dart';
import 'package:tala_app/core/utils/asset_image.dart';
import 'package:tala_app/core/widget/custom_outlined_button.dart';
import 'package:tala_app/core/widget/custom_tickets_title.dart';
import 'package:tala_app/feature/payment/presentation/view/widget/payment_tile.dart';
import 'package:tala_app/feature/ticket/presentation/view/widget/custom_ticket_header.dart';
import 'package:tala_app/generated/locale_keys.g.dart';

class PaymentMethodsBody extends StatelessWidget {
  const PaymentMethodsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimensions.r25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTicketHeader(title: LocaleKeys.payment_methods.tr()),
                SizedBox(height: AppDimensions.h61),
                const CustomTicketsTitle(title: 'Credit & Debit Card',),
                SizedBox(height: AppDimensions.h10),
                const PaymentTile(icon: AppImage.kCardIcon, text: 'Add Card',),
                 SizedBox(height: AppDimensions.h30),
                const CustomTicketsTitle(title: 'More Payment Options',),
                 SizedBox(height: AppDimensions.h10),
                const PaymentTile(icon: AppImage.kPaypalIcon, text: 'Add Card',),
                 SizedBox(height: AppDimensions.h8),
                const PaymentTile(icon: AppImage.kAppleIcon, text: 'Add Card',),
                 SizedBox(height: AppDimensions.h8),
                const PaymentTile(icon: AppImage.kGoogleIcon, text: 'Add Card',),
                SizedBox(height: AppDimensions.h145,),
                CustomOutlinedButton(onPressed: (){}, hintText: 'Confirm Payment',),

                
              ],
            ),
          ),
      ),
    );
  }

}
