import 'package:flutter/material.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/custom_text_field.dart';
import 'package:ticketing_apps/core/components/space.dart';
import 'package:ticketing_apps/core/constants/color.dart';
import 'package:ticketing_apps/core/extensions/idr_currency.dart';
import 'package:ticketing_apps/ui/home/payment_sucses_screen.dart';

class PaymentTunaiDialog extends StatefulWidget {
  final int totalPrice;
  const PaymentTunaiDialog({super.key, required this.totalPrice});

  @override
  State<PaymentTunaiDialog> createState() => _PaymentTunaiDialogState();
}

class _PaymentTunaiDialogState extends State<PaymentTunaiDialog> {
  final nominalController = TextEditingController();
  int nominalIndex = -1;

  @override
  void initState() {
    nominalController.text = widget.totalPrice.currencyFormatRp;
    super.initState();
  }

  @override
  void dispose() {
    nominalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpaceHeight(12),
          CustomTextField(
            controller: nominalController,
            label: 'Masukkan nominal',
            keyboardType: TextInputType.numberWithOptions(),
          ),
          SpaceHeight(20),
          Row(
            children: [
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    setState(() {
                      nominalIndex = 0;
                    });
                  },
                  textColor: nominalIndex == 0 ? Colors.white : AppColors.grey,
                  color: nominalIndex == 0
                      ? AppColors.primary
                      : Colors.transparent,
                  label: 'uang pas',
                  borderRadius: 10,
                  fontSize: 14,
                ),
              ),
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    setState(() {
                      nominalIndex = 1;
                    });
                  },
                  textColor: nominalIndex == 1 ? Colors.white : AppColors.grey,
                  color: nominalIndex == 1
                      ? AppColors.primary
                      : Colors.transparent,
                  label: 200000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    setState(() {
                      nominalIndex = 2;
                    });
                  },
                  textColor: nominalIndex == 2 ? Colors.white : AppColors.grey,
                  color: nominalIndex == 2
                      ? AppColors.primary
                      : Colors.transparent,
                  label: 150000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                ),
              ),
              Flexible(
                child: Button.outlined(
                  onPressed: () {
                    setState(() {
                      nominalIndex = 3;
                    });
                  },
                  textColor: nominalIndex == 3 ? Colors.white : AppColors.grey,
                  color: nominalIndex == 3
                      ? AppColors.primary
                      : Colors.transparent,
                  label: 300000.currencyFormatRp,
                  borderRadius: 10,
                  fontSize: 14,
                ),
              ),
            ],
          ),

          SpaceHeight(24),

          Button.filled(
            onPressed: () => PaymentSuccessScreen(),
            label: 'Bayar',
            borderRadius: 10,
          ),
        ],
      ),
    );
  }
}
