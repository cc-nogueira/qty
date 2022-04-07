import 'dart:math';

import 'physical_property.dart';
import 'unit.dart';

/// Dimensionless function to convert a quantity magnitude for an asked unit transformation
typedef QuantityConverter = double Function(double);

/// Interface for unit conversion.
///
/// Exposes an abstract QuantityConverter getter.
abstract class UnitConverter<K extends Kind> {
  const UnitConverter();

  QuantityConverter quantityConverter({required Unit<K> fromUnit, required Unit<K> toUnit});
}

class FixedAmountUnitConverter<K extends Kind> extends UnitConverter<K> {
  const FixedAmountUnitConverter();

  @override
  QuantityConverter quantityConverter({required Unit<K> fromUnit, required Unit<K> toUnit}) =>
      (double value) => value;
}

/// Most common [UnitConverter] for linear conversions.
///
/// Use a table of unit factors to convert values linearly.
class LinearUnitConverter<K extends LinearConvertiblePhysicalProperty<K>> extends UnitConverter<K> {
  LinearUnitConverter();

  final Map<LinearConvertibleUnit<K>, double> _factors = {};

  void add({required LinearConvertibleUnit<K> unit, required double factor}) =>
      _factors[unit] = factor;

  double convertionFactor(
          {required LinearConvertibleUnit<K> fromUnit, required LinearConvertibleUnit<K> toUnit}) =>
      fromUnit == toUnit ? 1.0 : _factors[fromUnit]! / _factors[toUnit]!;

  @override
  QuantityConverter quantityConverter(
          {required covariant LinearConvertibleUnit<K> fromUnit,
          required covariant LinearConvertibleUnit<K> toUnit}) =>
      (quantity) => quantity * convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
}

/// [UnitConverter] that uses the decimal system for [Unit] conversion.
///
/// Has better precisicion using the difference in the power of ten factor for [Unit] conversion,
/// better then a plain double [LinearUnitConverter].
class PowerOfTenUnitConverter<K extends LinearConvertiblePhysicalProperty<K>>
    extends LinearUnitConverter<K> {
  final Map<Unit<K>, int> _powers = {};

  @override
  void add({required LinearConvertibleUnit<K> unit, required double factor}) {
    super.add(unit: unit, factor: factor);
    _powers[unit] = (log10e * log(factor)).round();
  }

  @override
  double convertionFactor(
      {required LinearConvertibleUnit<K> fromUnit, required LinearConvertibleUnit<K> toUnit}) {
    return pow(10, _powers[fromUnit]! - _powers[toUnit]!).toDouble();
  }
}
