import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/appColors.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/sheared/customButtonWidget.dart';
import '../../../core/sheared/customTextFormField.dart';
import '../../../core/sheared/spacing_widgets.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'First Name',
            controller: _firstNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Missed';
              }
              return null;
            },
            isPassword: false,
          ),
          const HeightSpace(height: 15),
          CustomTextFormField(
            hintText: 'Last Name',
            controller: _lastNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Missed';
              }
              return null;
            },
            isPassword: false,
          ),
          const HeightSpace(height: 15),
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
            buttonText: 'Sign Up',
            onPress: () {
              if (formKey.currentState!.validate()) {
                // Handle Sign Up logic
                GoRouter.of(context).push(AppRoutes.signUpPage);
              }
            },
          ),
        ],
      ),
    );
  }
}
