import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: SignUpBody()),
    );
  }
}
