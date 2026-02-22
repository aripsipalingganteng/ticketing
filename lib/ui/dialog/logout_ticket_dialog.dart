import 'package:flutter/material.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/space.dart';
import 'package:ticketing_apps/core/constants/color.dart';
import 'package:ticketing_apps/core/extensions/build_context_ext.dart';
import 'package:ticketing_apps/data/local_datasource/auth_local_datasource.dart';
import 'package:ticketing_apps/ui/auth/splash_screen.dart';

class LogoutTicketDialog extends StatefulWidget {
  const LogoutTicketDialog({super.key});

  @override
  State<LogoutTicketDialog> createState() => _LogoutTicketDialogState();
}

class _LogoutTicketDialogState extends State<LogoutTicketDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Logout',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SpaceHeight(12),
          Text(
            'Apakah anda yakin ingin logout?',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.black.withOpacity(65 / 100),
            ),
            textAlign: TextAlign.center,
          ),
          SpaceHeight(18),
          Row(
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () => Navigator.pop(context),
                  label: "Batalkan",
                  color: AppColors.buttonCancel,
                  height: 44,
                  fontSize: 14,
                  borderRadius: 8,
                  textColor: AppColors.grey,
                ),
              ),
              SpaceWidth(8),
              Flexible(
                child: Button.filled(
                  borderRadius: 8,
                  height: 44,
                  fontSize: 14,
                  onPressed: () async {
                    await AuthLocalDatasource().removeAuthData();
                    context.pushReplacement(SplashScreen());
                  },
                  label: 'Logout',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}