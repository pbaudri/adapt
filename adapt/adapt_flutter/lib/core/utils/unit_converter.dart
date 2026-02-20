/// Unit conversion utilities.
///
/// All values are stored in SI units (kg, cm).
/// These helpers convert to/from display units only.
abstract final class UnitConverter {
  // ── Weight ──────────────────────────────────────────────────────────────
  static double kgToLbs(double kg) => kg * 2.20462;
  static double lbsToKg(double lbs) => lbs / 2.20462;

  /// Format weight for display given the user's preferred unit.
  static String formatWeight(double kg, String unit) {
    if (unit == 'lbs') {
      return '${kgToLbs(kg).round()} lbs';
    }
    return '${kg.round()} kg';
  }

  // ── Height ──────────────────────────────────────────────────────────────
  static double cmToInches(double cm) => cm / 2.54;
  static double inchesToCm(double inches) => inches * 2.54;

  /// Format height for display given the user's preferred unit.
  static String formatHeight(double cm, String unit) {
    if (unit == 'ft') {
      final totalInches = cmToInches(cm);
      final feet = totalInches ~/ 12;
      final inches = (totalInches % 12).round();
      return "$feet' $inches\"";
    }
    return '${cm.round()} cm';
  }

  /// Parse a weight string in the given unit to kg.
  static double? parseWeightToKg(String input, String unit) {
    final value = double.tryParse(input);
    if (value == null) return null;
    return unit == 'lbs' ? lbsToKg(value) : value;
  }

  /// Parse a height string in the given unit to cm.
  static double? parseHeightToCm(String input, String unit) {
    final value = double.tryParse(input);
    if (value == null) return null;
    return unit == 'ft' ? inchesToCm(value * 12) : value;
  }
}
