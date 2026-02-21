import 'package:adapt_theme/adapt_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_routes.dart';
import '../providers/home_provider.dart';

/// Greeting and morning recap banner at the top of the home screen.
class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeAsync = ref.watch(homeDataProvider);

    final greeting = homeAsync.whenOrNull(
      data: (data) => data.greeting,
    ) ?? 'Good morning.';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting, style: AppTextStyles.titleLarge),
              const SizedBox(height: AppDimensions.spacing4),
              Text(
                'Here is how your day looks.',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.push(AppRoutes.morningRecap),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
            child: const Icon(
              Icons.wb_sunny_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
