import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';

import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AdaptApp());
}

class AdaptApp extends StatelessWidget {
  const AdaptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Adapt',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}
