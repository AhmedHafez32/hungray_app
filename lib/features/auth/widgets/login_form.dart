import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/appColors.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/sheared/customButtonWidget.dart';
import '../../../core/sheared/customTextFormField.dart';
import '../../../core/sheared/spacing_widgets.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
    return Form(
      child: Column(
        children: [
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
    );
  }
}
