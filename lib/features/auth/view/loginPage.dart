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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Form(
        key: formKey,
        child: Center(
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
                CustomTextFormField(
                  hintText: 'Email',
                  suffixIcon: const Icon(Icons.email, color: AppColors.primary),
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Missed';
                    }
                    if (value.length < 12) {
                      return 'Email must be at least 11 characters';
                    }
                    return null;
                  },
                  isPassword: false,
                ),
                const HeightSpace(height: 15),
                CustomTextFormField(
                  hintText: 'Password',
                  suffixIcon: const Icon(
                    Icons.remove_red_eye,
                    color: AppColors.primary,
                  ),
                  controller: _passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Missed';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const HeightSpace(height: 15),
                CustomButtonWidget(
                  buttonText: 'Login',
                  onPress: () {
                    if (formKey.currentState!.validate()) {
                      // Handle login logic
                      GoRouter.of(context).push(AppRoutes.signUpPage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
