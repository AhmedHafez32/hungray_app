import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/core/constants/appAssets.dart';
import 'package:hungry/core/constants/appColors.dart';
import 'package:hungry/core/sheared/spacing_widgets.dart';
import 'package:hungry/core/styles/appStyles.dart';
import 'package:hungry/features/auth/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.appLogo),
              const HeightSpace(height: 15),
              Text(
                'Welcome Back, Discover the fast food',
                style: AppStyles.white16W500,
              ),
              const HeightSpace(height: 40),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
