import 'dart:math';

import 'physical_property.dart';
import 'unit.dart';

/// Dimensionless function to convert a quantity magnitude for an asked unit transformation
typedef QuantityConverter = double Function(double);

/// Most common [UnitConverter] for linear conversions.
///
/// Use a table of unit factors to convert values linearly.
class UnitConverter<K extends PhysicalProperty<K>> {
  UnitConverter();

  final Map<Unit<K>, double> _factors = {};

  void add({required Unit<K> unit, required double factor}) => _factors[unit] = factor;

  double convertionFactor({required Unit<K> fromUnit, required Unit<K> toUnit}) =>
      fromUnit == toUnit ? 1.0 : _factors[fromUnit]! / _factors[toUnit]!;

  QuantityConverter quantityConverter(
          {required covariant Unit<K> fromUnit, required covariant Unit<K> toUnit}) =>
      (quantity) => quantity * convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
}

/// [UnitConverter] that uses the decimal system for [Unit] conversion.
///
/// Has better precisicion using the difference in the power of ten factor for [Unit] conversion,
/// better then a plain double [LinearUnitConverter].
class PowerOfTenUnitConverter<K extends PhysicalProperty<K>> extends UnitConverter<K> {
  final Map<Unit<K>, int> _powers = {};

  @override
  void add({required Unit<K> unit, required double factor}) {
    super.add(unit: unit, factor: factor);
    _powers[unit] = (log10e * log(factor)).round();
  }

  @override
  double convertionFactor({required Unit<K> fromUnit, required Unit<K> toUnit}) {
    return pow(10, _powers[fromUnit]! - _powers[toUnit]!).toDouble();
  }

  double poweredConvertionFactor(
      {required Unit<K> fromUnit, required Unit<K> toUnit, required int power}) {
    return pow(10, (_powers[fromUnit]! - _powers[toUnit]!) * power).toDouble();
  }
}

class FixedAmountUnitConverter<K extends PhysicalProperty<K>> extends UnitConverter<K> {
  FixedAmountUnitConverter();

  @override
  QuantityConverter quantityConverter({required Unit<K> fromUnit, required Unit<K> toUnit}) =>
      (double value) => value;
}
