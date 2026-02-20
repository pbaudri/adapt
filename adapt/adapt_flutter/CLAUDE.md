# adapt_flutter — Flutter Instructions

## Context7

Before implementing any feature, use Context7 to fetch the latest docs for the packages involved.

```
use context7 to get the latest docs for flutter_riverpod
use context7 to get the latest docs for go_router
use context7 to get the latest docs for freezed
```

This is especially important for:
- Riverpod providers syntax (`@riverpod`, `@Riverpod(keepAlive: true)`)
- go_router route declarations and redirects
- Freezed union types and `copyWith` patterns

## Architecture

Clean Architecture, feature-first folder structure.

```
features/
└── feature_name/
    ├── data/
    │   └── feature_repository.dart      # Calls adapt_client endpoints only
    ├── domain/
    │   └── feature_state.dart           # Freezed state models
    └── presentation/
        ├── feature_screen.dart
        ├── widgets/                     # Feature-specific widgets only
        └── providers/
            └── feature_provider.dart   # Riverpod providers
```

Implementation order for any new feature:
1. Repository (`data/`)
2. State model (`domain/`)
3. Provider (`presentation/providers/`)
4. Screen + widgets (`presentation/`)

## State Management — Riverpod

Use code generation exclusively (`@riverpod` annotation).
Never use `StateNotifier`, `ChangeNotifier`, or `setState` outside isolated leaf widgets.
Always use `AsyncValue` for async states.

```dart
// Correct pattern
@riverpod
Future<HomeData> homeData(HomeDataRef ref) async {
  return ref.watch(homeRepositoryProvider).getHomeData();
}
```

Fetch the latest Riverpod syntax via Context7 before any provider implementation.

## Navigation — go_router

All routes are defined in `core/router/app_router.dart`.
All route names are constants in `core/router/app_routes.dart`.
Never use `Navigator.push` directly.

```dart
// Correct
context.push(AppRoutes.mealResult);
context.pop();

// Never
Navigator.push(context, MaterialPageRoute(...));
```

Fetch the latest go_router syntax via Context7 before implementing redirects or nested navigation.

## Models — Freezed

All state models and domain objects use Freezed.
Run `melos run build_runner` after any model change.

```dart
// Correct pattern
@freezed
class MealState with _$MealState {
  const factory MealState.initial() = _Initial;
  const factory MealState.loading() = _Loading;
  const factory MealState.success(MealResult result) = _Success;
  const factory MealState.error(String message) = _Error;
}
```

Fetch the latest Freezed syntax via Context7 before implementing new models.

## Design System — adapt_theme

Always import via the barrel file:

```dart
import 'package:adapt_theme/adapt_theme.dart';
```

**Before creating any widget**, check `adapt_theme/lib/widgets/` to see if it already exists.

Full widget inventory is in `ARCHITECTURE.md` section 6.

Shared reusable widgets → `adapt_theme/lib/widgets/`
Feature-specific widgets → `features/xxx/presentation/widgets/`

## Strict Rules

```dart
// NEVER — hardcoded color
color: Color(0xFF6C63FF)
// ALWAYS
color: AppColors.primary

// NEVER — hardcoded TextStyle
style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)
// ALWAYS
style: AppTextStyles.titleLarge

// NEVER — hardcoded radius
borderRadius: BorderRadius.circular(16)
// ALWAYS
borderRadius: BorderRadius.circular(AppDimensions.radiusMedium)

// NEVER — direct API call in a widget or provider
final response = await http.get(...)
// ALWAYS — go through a repository
final data = await ref.watch(homeRepositoryProvider).getHomeData();
```

## Folder Structure

```
adapt_flutter/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   ├── router/
│   │   │   ├── app_router.dart
│   │   │   └── app_routes.dart
│   │   └── utils/
│   │       ├── unit_converter.dart     # kg↔lbs, cm↔ft — only place for unit conversion
│   │       └── date_formatter.dart
│   └── features/
│       ├── auth/
│       ├── onboarding/
│       ├── home/
│       ├── meal_log/
│       ├── drinks/
│       ├── history/
│       ├── profile/
│       └── morning_recap/
└── pubspec.yaml
```

## pubspec.yaml Dependencies

```yaml
dependencies:
  flutter_riverpod: latest
  riverpod_annotation: latest
  freezed_annotation: latest
  go_router: latest
  serverpod_client: latest
  sqflite: latest
  image_picker: latest
  cached_network_image: latest
  permission_handler: latest
  flutter_local_notifications: latest
  intl: latest
  flutter_dotenv: latest
  adapt_theme:
    path: ../adapt_theme

dev_dependencies:
  riverpod_generator: latest
  freezed: latest
  build_runner: latest
```

Always verify exact latest versions via Context7 before setting up `pubspec.yaml`.