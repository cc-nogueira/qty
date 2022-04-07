import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

/// "System of Measurement" or "System of Units" for a [kind] of [PhysicalProperty].
///
/// Defines a system of measuremnt with an appropriate [UnitCovnerter] and a collection of [Unit] instances mapped by their symbol.
/// Exposes an API to define and manage a domain of [Unit]s, and a single [baseUnit].
/// Provides access to [QuantityConverter] between units of its domains and to the base unit of another [SystemOfMeasure].
abstract class SystemOfMeasurent<K extends PhysicalProperty> {
  SystemOfMeasurent({required this.name, required this.kind, required this.unitConverter})
      : _units = {};

  /// Name of this System of Measurement ("International System of Units", "Imperial System of Units")
  final String name;

  /// PhysicalProperty of the units registered in this System of Units
  final K kind;

  /// UnitConverter optimized for units in this System of Measurement
  final UnitConverter<K> unitConverter;

  final Map<String, Unit<K>> _units;
  late final Unit<K> _baseUnit;
  late final double _baseUnitConversionFactor;

  /// Compare two System of Measurements to verify if they are for the same [PhysicalProperty]
  bool sameKind(SystemOfMeasurent otherSystem) => kind == otherSystem.kind;

  /// Define the baseUnit for this System of Measuremnt with its conversionFactor to the first
  /// System of Measurement of its Physical Property, allowing inter-systems unit conversions.
  ///
  /// This method can be called only once for each SystemOfMeasument.
  Unit<K> defineBaseUnit({required String symbol, required String name, required double factor}) {
    final unit = defineUnit(symbol: symbol, name: name);
    _baseUnit = unit;
    _baseUnitConversionFactor = factor;
    return unit;
  }

  /// Getter for this System of Measurent base unit
  Unit<K> get baseUnit => _baseUnit;

  /// Defines a unit with symbol and registers it in this System of Measurements
  Unit<K> defineUnit({required String symbol, required String name}) {
    final unit = Unit<K>(this, name: name, symbol: symbol);
    registerUnit(unit);
    return unit;
  }

  /// Register (store) a unit in this System of Measurement.
  ///
  /// This method is called by the internal API (this class and subclasses)
  void registerUnit(Unit<K> unit) => _units[unit.symbol] = unit;

  /// List all units in this SystemOfMeasurement
  List<Unit<K>> get units => _units.values.toList();

  /// Finds an unit by its symbol. Retuns null if none is found
  Unit<K>? unitWith({required String symbol}) => _units[symbol];

  /// Compose a QuantityConverter function to convert amounts from one SystemOfMeasurement baseUnit to another SystemOfMeasurement baseUnit
  QuantityConverter baseUnitConverterTo(SystemOfMeasurent<K> anotherSystem) =>
      (quantity) => quantity * _baseUnitConversionFactor / anotherSystem._baseUnitConversionFactor;

  /// Compose a QuantityConverter function to convert amounts from one unit to another
  QuantityConverter quantityConverter({required Unit<K> fromUnit, required Unit<K> toUnit}) {
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

/// A System of Units without unit conversion.
///
/// Converted units are returned with the same amount as the original unit.
/// It is used by Dimensionless and Named Physical Properties.
class FixedSystemOfUnits<K extends PhysicalProperty> extends SystemOfMeasurent<K> {
  FixedSystemOfUnits({required K kind})
      : super(
            kind: kind,
            name: 'FixedSystemOfUnits',
            unitConverter: const FixedAmountUnitConverter());
}

/// General class for systems of units with linear convertible units.
///
/// This is a full functional class that supports most [SystemOfMeasurent] units, such as [InternationalSystemOfUnits] (SI), [ImperialSystemOfUnits] and [NauticalSystemOfUnits].
/// It does not support more complex units conversions such as the Fahrenheit scale for Temperature.
class LinearConvertibleSystemOfUnits<K extends LinearConvertiblePhysicalProperty>
    extends SystemOfMeasurent<K> {
  LinearConvertibleSystemOfUnits(
      {required String name, required K kind, LinearUnitConverter<K>? unitConverter})
      : super(name: name, kind: kind, unitConverter: unitConverter ?? LinearUnitConverter<K>());

  @override
  LinearUnitConverter<K> get unitConverter => super.unitConverter as LinearUnitConverter<K>;

  @override
  LinearConvertibleUnit<K> defineUnit({required String symbol, required String name}) =>
      defineUnitWithFactor(symbol: symbol, name: name, factor: 1.0);

  @override
  LinearConvertibleUnit<K> get baseUnit => super.baseUnit as LinearConvertibleUnit<K>;

  /// Defines an Unit with a conversion factor to the baseUnit of this SystemOfMeasurent
  LinearConvertibleUnit<K> defineUnitWithFactor(
      {required String symbol, required String name, required double factor}) {
    final unit = LinearConvertibleUnit<K>(this, name: name, symbol: symbol);
    registerUnit(unit);
    unitConverter.add(unit: unit, factor: factor);
    return unit;
  }

  /// List all units in this SystemOfMeasurement
  @override
  List<LinearConvertibleUnit<K>> get units => super.units.cast<LinearConvertibleUnit<K>>();

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  LinearConvertibleUnit<K>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as LinearConvertibleUnit<K>?;

  /// Returns the conversionFactor between two units of this SystemOfMeasurement
  double conversionFactor(
      {required LinearConvertibleUnit<K> fromUnit, required LinearConvertibleUnit<K> toUnit}) {
    if (fromUnit.systemOfMeasurent != this) {
      throw IncompatibleSystemOfMeasureException(systemOfMeasure: this, unit: fromUnit);
    }
    if (toUnit.systemOfMeasurent != this) {
      throw IncompatibleSystemOfMeasureException(systemOfMeasure: this, unit: toUnit);
    }
    return unitConverter.convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
  }
}

/// International System of Units, also known as SI.
///
/// It is the international statandard following the metric system of units.
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class InternationalSystemOfUnits<K extends LinearConvertiblePhysicalProperty>
    extends LinearConvertibleSystemOfUnits<K> {
  InternationalSystemOfUnits({required K kind, LinearUnitConverter<K>? unitConverter})
      : super(
          name: 'International System of Units (SI)',
          kind: kind,
          unitConverter: unitConverter ?? PowerOfTenUnitConverter<K>(),
        );
}

/// Imperial or British System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class ImperialSystemOfUnits<K extends LinearConvertiblePhysicalProperty>
    extends LinearConvertibleSystemOfUnits<K> {
  ImperialSystemOfUnits({required K kind})
      : super(
          name: 'Imperial System of Units',
          kind: kind,
        );
}

/// Nautical System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class NauticalSystemOfUnits<K extends LinearConvertiblePhysicalProperty>
    extends LinearConvertibleSystemOfUnits<K> {
  NauticalSystemOfUnits({required K kind})
      : super(
          name: 'Nautical System of Units',
          kind: kind,
        );
}

/// Exception for incompatible [SystemOfMeasurent] instances.
class IncompatibleSystemOfMeasureException implements Exception {
  const IncompatibleSystemOfMeasureException({required this.systemOfMeasure, required this.unit});

  final SystemOfMeasurent systemOfMeasure;
  final Unit unit;

  @override
  String toString() =>
      'Unit of ${unit.kind} "${unit.symbol}" is not part of "${systemOfMeasure.name}" for "${systemOfMeasure.kind}"';
}
