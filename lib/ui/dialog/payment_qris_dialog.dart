import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticketing/core/components/space.dart';
import 'package:ticketing/core/constants/color.dart';
import 'package:ticketing/core/extensions/build_context_ext.dart';
import 'package:ticketing/ui/home/payment_sucses_screen.dart';
import 'package:timer_count_down/timer_count_down.dart';

class PaymentQrisDialog extends StatelessWidget {
  const PaymentQrisDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Show this QR code to customer'),
          SpaceHeight(24),
          InkWell(
            onTap: () => context.pushReplacement(PaymentSuccessScreen()),
            child: SizedBox(
              width: 200,
              height: 200,
              child: QrImageView(
                data: 'data',
                version: QrVersions.auto,
              ),
            ),
          ),

          SpaceHeight(24),
          Countdown(
            seconds: 60,
            build: (context, time) {
              return Text.rich(
                TextSpan(
                  text: 'Update After',
                  children: [
                    TextSpan(
                      text: '${time.toInt()}s',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
            onFinished: () {},                     
          ),
        ],
      ),
    );
  }
}