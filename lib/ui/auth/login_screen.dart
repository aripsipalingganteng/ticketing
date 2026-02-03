import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticketing/core/components/button.dart';
import 'package:ticketing/core/components/custom_text_field.dart';
import 'package:ticketing/core/components/space.dart';
import 'package:ticketing/core/constants/color.dart';
import 'package:ticketing/gen/assets/assets.gen.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

      final emailController = TextEditingController();
      final passwordController = TextEditingController();


    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          //bagian 1
          SizedBox(
            height: 200,
            child: Center(child: Assets.images.logoWhite.image(height: 55)),
          ),

          //bagian 2
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(20),
                ),
                child: ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 44,
                      horizontal: 28, 
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          label: 'Email', 
                          controller: emailController,
                          isOutlineBorder: false,
                        ),
                        SpaceHeight(36),
                        CustomTextField(
                          controller: passwordController, 
                          label: 'password',
                          isOutlineBorder: false,
                          obscureText: true,
                        ),
                        SpaceHeight(86),
                        Button.filled(onPressed: () {}, label: 'login'),
                        SpaceHeight(120),
                        Center(child: Assets.images.logo.image(height: 40),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}