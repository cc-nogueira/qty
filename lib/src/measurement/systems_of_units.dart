import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

/// "System of Units" or "System of Measurement" for a [kind] of [PhysicalProperty].
///
/// Defines a system of measuremnt with an appropriate [UnitCovnerter] and a collection of [Unit] instances mapped by their symbol.
/// Exposes an API to define and manage a domain of [Unit]s, and a single [baseUnit].
/// Provides access to [QuantityConverter] between units of its domains and to the base unit of another [SystemOfMeasure].
///
/// This is a full functional class that supports most [SystemOfUnits] units, such as [InternationalSystemOfUnits] (SI), [ImperialSystemOfUnits] and [NauticalSystemOfUnits].
/// It does not support more complex units conversions such as the Fahrenheit scale for Temperature.
abstract class SystemOfUnits<K extends PhysicalProperty<K>> {
  SystemOfUnits({required this.name, required this.kind, UnitConverter<K>? unitConverter})
      : unitConverter = unitConverter ?? UnitConverter();

  /// Name of this System of Units ("International System of Units", "Imperial System of Units")
  final String name;

  /// PhysicalProperty of the units registered in this System of Units
  final K kind;

  /// UnitConverter optimized for units in this System of Units
  final UnitConverter<K> unitConverter;

  final _units = <String, Unit<K>>{};
  late final Unit<K> _baseUnit;
  late final double _baseUnitConversionFactor;

  /// Compare two System of Units to verify if they are for the same [PhysicalProperty]
  bool sameKind(SystemOfUnits otherSystem) => kind == otherSystem.kind;

  /// Define the baseUnit for this System of Units with its conversionFactor to the first
  /// System of Units of its Physical Property, allowing inter-systems unit conversions.
  ///
  /// This method can be called only once for each SystemOfUnit.
  Unit<K> defineBaseUnit({required String symbol, required String name, required double factor}) {
    final unit = defineUnit(symbol: symbol, name: name);
    _baseUnit = unit;
    _baseUnitConversionFactor = factor;
    return unit;
  }

  /// Getter for this System of Units base unit
  Unit<K> get baseUnit => _baseUnit;

  /// Defines a unit with symbol and registers it in this System of Units
  Unit<K> defineUnit({required String symbol, required String name, double factor = 1.0}) {
    final unit = Unit<K>(this, name: name, symbol: symbol);
    registerUnit(unit);
    unitConverter.add(unit: unit, factor: factor);
    return unit;
  }

  /// Register (store) a unit in this System of Units.
  ///
  /// This method is called by the internal API (this class and subclasses)
  void registerUnit(Unit<K> unit) => _units[unit.symbol] = unit;

  /// List all units in this SystemOUnits
  List<Unit<K>> get units => _units.values.toList();

  /// Finds an unit by its symbol. Retuns null if none is found
  Unit<K>? unitWith({required String symbol}) => _units[symbol];

  /// Compose a QuantityConverter function to convert amounts from one SystemOfUnits baseUnit to another SystemOfUnits baseUnit
  QuantityConverter baseUnitConverterTo(SystemOfUnits<K> anotherSystem) =>
      (quantity) => quantity * _baseUnitConversionFactor / anotherSystem._baseUnitConversionFactor;

  /// Compose a QuantityConverter function to convert amounts from one unit to another
  QuantityConverter quantityConverter({required Unit<K> fromUnit, required Unit<K> toUnit}) {
    if (fromUnit.systemOfUnits != this) {
      return fromUnit.quantityConverterTo(toUnit);
    }
    if (fromUnit.kind != toUnit.kind) {
      throw IncompatibleUnitsException(fromUnit, toUnit);
    }
    return unitConverter.quantityConverter(fromUnit: fromUnit, toUnit: toUnit);
  }

  /// Returns the conversionFactor between two units of this SystemOfUnits
  double conversionFactor({required Unit<K> fromUnit, required Unit<K> toUnit}) {
    if (fromUnit.systemOfUnits != this) {
      throw IncompatibleSystemOfMeasureException(systemOfUnits: this, unit: fromUnit);
    }
    if (toUnit.systemOfUnits != this) {
      throw IncompatibleSystemOfMeasureException(systemOfUnits: this, unit: toUnit);
    }
    return unitConverter.convertionFactor(fromUnit: fromUnit, toUnit: toUnit);
  }

  @override
  bool operator ==(Object other) =>
      other is SystemOfUnits && kind == other.kind && name == other.name;

  @override
  int get hashCode => kind.hashCode ^ name.hashCode;
}

/// A System of Units without unit conversion.
///
/// Converted units are returned with the same amount as the original unit.
/// It is used by Dimensionless and Named Physical Properties.
class FixedSystemOfUnits<K extends PhysicalProperty<K>> extends SystemOfUnits<K> {
  FixedSystemOfUnits({required K kind})
      : super(kind: kind, name: 'FixedSystemOfUnits', unitConverter: FixedAmountUnitConverter());
}

/// International System of Units, also known as SI.
///
/// It is the international statandard following the metric system of units.
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class InternationalSystemOfUnits<K extends PhysicalProperty<K>> extends SystemOfUnits<K> {
  InternationalSystemOfUnits({required K kind, UnitConverter<K>? unitConverter})
      : super(
          name: 'International System of Units (SI)',
          kind: kind,
          unitConverter: unitConverter ?? PowerOfTenUnitConverter<K>(),
        );
}

/// Imperial or British System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class ImperialSystemOfUnits<K extends PhysicalProperty<K>> extends SystemOfUnits<K> {
  ImperialSystemOfUnits({required K kind}) : super(name: 'Imperial System of Units', kind: kind);
}

/// Nautical System of Units.
///
/// Will be configured by each [PhysicalProperty] especialization with its collection of [Unit] instances.
class NauticalSystemOfUnits<K extends PhysicalProperty<K>> extends SystemOfUnits<K> {
  NauticalSystemOfUnits({required K kind}) : super(name: 'Nautical System of Units', kind: kind);
}

/// Exception for incompatible [SystemOfMeasurement] instances.
class IncompatibleSystemOfMeasureException implements Exception {
  const IncompatibleSystemOfMeasureException({required this.systemOfUnits, required this.unit});

  final SystemOfUnits systemOfUnits;
  final Unit unit;

  @override
  String toString() =>
      'Unit of ${unit.kind} "${unit.symbol}" is not part of "${systemOfUnits.name}" for "${systemOfUnits.kind}"';
}
