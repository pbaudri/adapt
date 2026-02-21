import 'package:adapt_client/adapt_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(HomeData data) = _Success;
  const factory HomeState.error(String message) = _Error;
}
