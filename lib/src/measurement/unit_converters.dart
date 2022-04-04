import 'dart:math';

import 'measurement.dart';

/// Most common [UnitConverter] for linear conversions.
///
/// Use a table of unit factors to convert values linearly.
class LinearUnitConverter extends UnitConverter {
  LinearUnitConverter();

  final Map<LinearConvertibleUnit, double> _factors = {};

  void add({required LinearConvertibleUnit unit, required double factor}) =>
      _factors[unit] = factor;

  double convertionFactor(
          {required LinearConvertibleUnit fromUnit,
          required LinearConvertibleUnit toUnit}) =>
      fromUnit == toUnit ? 1.0 : _factors[fromUnit]! / _factors[toUnit]!;

  @override
  QuantityConverter quantityConverter(
          {required covariant LinearConvertibleUnit fromUnit,
          required covariant LinearConvertibleUnit toUnit}) =>
      (quantity) =>
          quantity * convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
}

/// [UnitConverter] that uses the decimal system for [Unit] conversion.
///
/// Has better precisicion using the difference in the power of ten factor for [Unit] conversion,
/// better then a plain double [LinearUnitConverter].
class PowerOfTenUnitConverter extends LinearUnitConverter {
  final Map<Unit, int> _powers = {};

  @override
  void add({required LinearConvertibleUnit unit, required double factor}) {
    super.add(unit: unit, factor: factor);
    _powers[unit] = (log10e * log(factor)).round();
  }

  @override
  double convertionFactor(
      {required LinearConvertibleUnit fromUnit,
      required LinearConvertibleUnit toUnit}) {
    return pow(10, _powers[fromUnit]! - _powers[toUnit]!).toDouble();
  }
}
