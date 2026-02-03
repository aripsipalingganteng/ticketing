import 'package:flutter/material.dart';
import 'package:ticketing/core/extensions/build_context_ext.dart';
import 'package:ticketing/gen/assets/assets.gen.dart';
import 'package:ticketing/ui/auth/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(
      Duration(seconds: 2),
      () => context.pushReplacement(LoginScreen()),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Assets.images.logoBlue.image()),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Assets.images.logo.image(width: 96)
      ),
    );
  }
}
