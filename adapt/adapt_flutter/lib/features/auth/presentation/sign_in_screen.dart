import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: SignInBody()),
    );
  }
}
