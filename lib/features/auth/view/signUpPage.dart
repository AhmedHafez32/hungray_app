import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/constants/appAssets.dart';
import 'package:hungry/core/constants/appColors.dart';
import 'package:hungry/core/routing/app_routes.dart';
import 'package:hungry/core/sheared/customButtonWidget.dart';
import 'package:hungry/core/sheared/customTextFormField.dart';
import 'package:hungry/core/sheared/spacing_widgets.dart';
import 'package:hungry/core/styles/appStyles.dart';

import '../widgets/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                'Welcome to the app, Discover the fast food',
                style: AppStyles.white16W500,
              ),
              const HeightSpace(height: 40),
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
