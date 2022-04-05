import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

/// System of Measurement or System of Units for a [kind] of [PhysicalProperty].
///
/// Defines a system of measuremnt with an appropriate [UnitCovnerter] and a collection of [Unit] instances mapped by their symbol.
/// Exposes an API to define and manage a domain of [Unit]s, and a single [baseUnit].
/// Provides access to [QuantityConverter] between units of its domains and to the base unit of another [SystemOfMeasure].
abstract class SystemOfMeasurent {
  SystemOfMeasurent(
      {required this.name, required this.kind, required this.unitConverter})
      : _units = {};

  final String name;
  final PhysicalProperty kind;
  final UnitConverter unitConverter;
  final Map<String, Unit> _units;
  late final Unit _baseUnit;
  late final double _baseUnitConversionFactor;

  /// Compare two SystemOfMEasurement to verify if they are for the same [PhysicalProperty]
  bool sameKind(SystemOfMeasurent otherSystem) => kind == otherSystem.kind;

  /// Define the baseUnit for this SystemOfMeasuremnt and its conversionFactor to the other SystemOfMeasurements of the same kind.
  /// This method can be called only once for each SystemOfMeasument.
  Unit defineBaseUnit(
      {required String symbol, required String name, required double factor}) {
    final unit = defineUnit(symbol: symbol, name: name);
    _baseUnit = unit;
    _baseUnitConversionFactor = factor;
    return unit;
  }

  Unit get baseUnit => _baseUnit;

  /// Defines a unit with symbol and name
  Unit defineUnit({required String symbol, required String name}) {
    final unit = Unit(this, name: name, symbol: symbol);
    registerUnit(unit);
    return unit;
  }

  void registerUnit(Unit unit) => _units[unit.symbol] = unit;

  /// List all units in this SystemOfMeasurement
  List<Unit> get units => _units.values.toList();

  /// Finds an unit by its symbol. Retuns null if none is found
  Unit? unitWith({required String symbol}) => _units[symbol];

  /// Compose a QuantityConverter function to convert amounts from one SystemOfMeasurement baseUnit to another SystemOfMeasurement baseUnit
  QuantityConverter baseUnitConverterTo(SystemOfMeasurent anotherSystem) =>
      (quantity) =>
          quantity *
          _baseUnitConversionFactor /
          anotherSystem._baseUnitConversionFactor;

  /// Compose a QuantityConverter function to convert amounts from one unit to another
  QuantityConverter quantityConverter(
      {required Unit fromUnit, required Unit toUnit}) {
    if (fromUnit.systemOfMeasurent != this) {
      return fromUnit.quantityConverterTo(toUnit);
    }
    if (fromUnit.kind != toUnit.kind) {
      throw IncompatibleUnitsException(fromUnit, toUnit);
    }
    return unitConverter.quantityConverter(fromUnit: fromUnit, toUnit: toUnit);
  }

  @override
  bool operator ==(Object other) =>
      other is SystemOfMeasurent && kind == other.kind && name == other.name;

  @override
  int get hashCode => kind.hashCode ^ name.hashCode;
}

class FixedSystemOfUnits extends SystemOfMeasurent {
  FixedSystemOfUnits({required PhysicalProperty kind})
      : super(
            kind: kind,
            name: 'FixedSystemOfUnits',
            unitConverter: const FixedUnitConverter());
}

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
