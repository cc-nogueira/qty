import 'measurement.dart';
import 'unit_converters.dart';

/// General class for systems of units with linear convertible units.
///
/// This is a full functional class that supports most [SystemOfMeasurent] units, such as [InternationalSystemOfUnits] (SI), [ImperialSystemOfUnits] and [NauticalSystemOfUnits].
/// It does not support more complex units conversions such as the Fahrenheit scale for Temperature.
class LinearConvertibleSystemOfUnits extends SystemOfMeasurent {
  LinearConvertibleSystemOfUnits(
      {required String name,
      required PhysicalProperty kind,
      LinearUnitConverter? unitConverter})
      : super(
            name: name,
            kind: kind,
            unitConverter: unitConverter ?? LinearUnitConverter());

  @override
  LinearConvertiblePhysicalProperty get kind =>
      super.kind as LinearConvertiblePhysicalProperty;

  @override
  LinearUnitConverter get unitConverter =>
      super.unitConverter as LinearUnitConverter;

  @override
  LinearConvertibleUnit defineUnit(
          {required String symbol, required String name}) =>
      defineUnitWithFactor(symbol: symbol, name: name, factor: 1.0);

  @override
  LinearConvertibleUnit get baseUnit => super.baseUnit as LinearConvertibleUnit;

  /// Defines an Unit with a conversion factor to the baseUnit of this SystemOfMeasurent
  LinearConvertibleUnit defineUnitWithFactor(
      {required String symbol, required String name, required double factor}) {
    final unit = LinearConvertibleUnit(this, name: name, symbol: symbol);
    registerUnit(unit);
    unitConverter.add(unit: unit, factor: factor);
    return unit;
  }

  /// List all units in this SystemOfMeasurement
  @override
  List<LinearConvertibleUnit> get units =>
      super.units.cast<LinearConvertibleUnit>();

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  LinearConvertibleUnit? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as LinearConvertibleUnit?;

  /// Returns the conversionFactor between two units of this SystemOfMeasurement
  double conversionFactor(
      {required LinearConvertibleUnit fromUnit,
      required LinearConvertibleUnit toUnit}) {
    if (fromUnit.systemOfMeasurent != this) {
      throw IncompatibleSystemOfMeasureException(
          systemOfMeasure: this, unit: fromUnit);
    }
    if (toUnit.systemOfMeasurent != this) {
      throw IncompatibleSystemOfMeasureException(
          systemOfMeasure: this, unit: toUnit);
    }
    return unitConverter.convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
  }
}

/// International System of Units, also known as SI.
///
/// It is the international statandard following the metric system of units.
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class InternationalSystemOfUnits extends LinearConvertibleSystemOfUnits {
  InternationalSystemOfUnits(
      {required PhysicalProperty kind, LinearUnitConverter? unitConverter})
      : super(
          name: 'International System of Units (SI)',
          kind: kind,
          unitConverter: unitConverter ?? PowerOfTenUnitConverter(),
        );
}

/// Imperial or British System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class ImperialSystemOfUnits extends LinearConvertibleSystemOfUnits {
  ImperialSystemOfUnits({required PhysicalProperty kind})
      : super(
          name: 'Imperial System of Units',
          kind: kind,
        );
}

/// Nautical System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class NauticalSystemOfUnits extends LinearConvertibleSystemOfUnits {
  NauticalSystemOfUnits({required PhysicalProperty kind})
      : super(
          name: 'Nautical System of Units',
          kind: kind,
        );
}

/// Exception for incompatible [SystemOfMeasurent] instances.
class IncompatibleSystemOfMeasureException implements Exception {
  const IncompatibleSystemOfMeasureException(
      {required this.systemOfMeasure, required this.unit});

  final SystemOfMeasurent systemOfMeasure;
  final Unit unit;

  @override
  String toString() =>
      'Unit of ${unit.kind} "${unit.symbol}" is not part of "${systemOfMeasure.name}" for "${systemOfMeasure.kind}"';
}
