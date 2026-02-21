// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weekSummaryHash() => r'44d4c81d571ffdb53d31bee4d587e463662b4bfa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Returns week summary for [weekStartDate].
/// Automatically re-fetches when [weekStartDate] changes.
///
/// Copied from [weekSummary].
@ProviderFor(weekSummary)
const weekSummaryProvider = WeekSummaryFamily();

/// Returns week summary for [weekStartDate].
/// Automatically re-fetches when [weekStartDate] changes.
///
/// Copied from [weekSummary].
class WeekSummaryFamily extends Family<AsyncValue<List<DailySummary>>> {
  /// Returns week summary for [weekStartDate].
  /// Automatically re-fetches when [weekStartDate] changes.
  ///
  /// Copied from [weekSummary].
  const WeekSummaryFamily();

  /// Returns week summary for [weekStartDate].
  /// Automatically re-fetches when [weekStartDate] changes.
  ///
  /// Copied from [weekSummary].
  WeekSummaryProvider call(DateTime weekStartDate) {
    return WeekSummaryProvider(weekStartDate);
  }

  @override
  WeekSummaryProvider getProviderOverride(
    covariant WeekSummaryProvider provider,
  ) {
    return call(provider.weekStartDate);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'weekSummaryProvider';
}

/// Returns week summary for [weekStartDate].
/// Automatically re-fetches when [weekStartDate] changes.
///
/// Copied from [weekSummary].
class WeekSummaryProvider
    extends AutoDisposeFutureProvider<List<DailySummary>> {
  /// Returns week summary for [weekStartDate].
  /// Automatically re-fetches when [weekStartDate] changes.
  ///
  /// Copied from [weekSummary].
  WeekSummaryProvider(DateTime weekStartDate)
    : this._internal(
        (ref) => weekSummary(ref as WeekSummaryRef, weekStartDate),
        from: weekSummaryProvider,
        name: r'weekSummaryProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$weekSummaryHash,
        dependencies: WeekSummaryFamily._dependencies,
        allTransitiveDependencies: WeekSummaryFamily._allTransitiveDependencies,
        weekStartDate: weekStartDate,
      );

  WeekSummaryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.weekStartDate,
  }) : super.internal();

  final DateTime weekStartDate;

  @override
  Override overrideWith(
    FutureOr<List<DailySummary>> Function(WeekSummaryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeekSummaryProvider._internal(
        (ref) => create(ref as WeekSummaryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        weekStartDate: weekStartDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<DailySummary>> createElement() {
    return _WeekSummaryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeekSummaryProvider && other.weekStartDate == weekStartDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, weekStartDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WeekSummaryRef on AutoDisposeFutureProviderRef<List<DailySummary>> {
  /// The parameter `weekStartDate` of this provider.
  DateTime get weekStartDate;
}

class _WeekSummaryProviderElement
    extends AutoDisposeFutureProviderElement<List<DailySummary>>
    with WeekSummaryRef {
  _WeekSummaryProviderElement(super.provider);

  @override
  DateTime get weekStartDate => (origin as WeekSummaryProvider).weekStartDate;
}

String _$dayDetailHash() => r'2740d14bdfa21c141fa4feb0782daa4b5466fc38';

/// Returns full day detail for [date].
///
/// Copied from [dayDetail].
@ProviderFor(dayDetail)
const dayDetailProvider = DayDetailFamily();

/// Returns full day detail for [date].
///
/// Copied from [dayDetail].
class DayDetailFamily extends Family<AsyncValue<DayDetail>> {
  /// Returns full day detail for [date].
  ///
  /// Copied from [dayDetail].
  const DayDetailFamily();

  /// Returns full day detail for [date].
  ///
  /// Copied from [dayDetail].
  DayDetailProvider call(DateTime date) {
    return DayDetailProvider(date);
  }

  @override
  DayDetailProvider getProviderOverride(covariant DayDetailProvider provider) {
    return call(provider.date);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'dayDetailProvider';
}

/// Returns full day detail for [date].
///
/// Copied from [dayDetail].
class DayDetailProvider extends AutoDisposeFutureProvider<DayDetail> {
  /// Returns full day detail for [date].
  ///
  /// Copied from [dayDetail].
  DayDetailProvider(DateTime date)
    : this._internal(
        (ref) => dayDetail(ref as DayDetailRef, date),
        from: dayDetailProvider,
        name: r'dayDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$dayDetailHash,
        dependencies: DayDetailFamily._dependencies,
        allTransitiveDependencies: DayDetailFamily._allTransitiveDependencies,
        date: date,
      );

  DayDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.date,
  }) : super.internal();

  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<DayDetail> Function(DayDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DayDetailProvider._internal(
        (ref) => create(ref as DayDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DayDetail> createElement() {
    return _DayDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DayDetailProvider && other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DayDetailRef on AutoDisposeFutureProviderRef<DayDetail> {
  /// The parameter `date` of this provider.
  DateTime get date;
}

class _DayDetailProviderElement
    extends AutoDisposeFutureProviderElement<DayDetail>
    with DayDetailRef {
  _DayDetailProviderElement(super.provider);

  @override
  DateTime get date => (origin as DayDetailProvider).date;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
