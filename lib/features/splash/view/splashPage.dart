import 'dart:async' show Timer;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hungry/core/constants/appAssets.dart';
import 'package:hungry/core/constants/appColors.dart';
import 'package:hungry/core/routing/app_routes.dart';

import '../../../core/sheared/spacing_widgets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  void _navigateAfterDelay(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      GoRouter.of(context).pushReplacement(AppRoutes.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigateAfterDelay(context);
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeightSpace(height: 200),
            SvgPicture.asset(AppAssets.appLogo),
            Spacer(),
            Image.asset(AppAssets.splashImage),
          ],
        ),
      ),
    );
  }
}
