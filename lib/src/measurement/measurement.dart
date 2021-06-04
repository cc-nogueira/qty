import 'dart:collection';

import 'package:equatable/equatable.dart';

/// Dimensionless function to convert a quantity magnitude for an asked unit transformation
typedef QuantityConverter = double Function(double);

/// System of Measurement or System of Units for a [kind] of [PhysicalProperty].
///
/// Defines a system of measuremnt with an appropriate [UnitCovnerter] and a collection of [Unit] instances mapped by their symbol.
/// Exposes an API to define and manage a domain of [Unit]s, and a single [baseUnit].
/// Provides access to [QuantityConverter] between units of its domains and to the base unit of another [SystemOfMeasure].
abstract class SystemOfMeasurent {
  SystemOfMeasurent(
      {required this.name, required this.kind, required this.unitConverter})
      : _units = HashMap();

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
    final unit = Unit(this, symbol, name);
    _units[symbol] = unit;
    return unit;
  }

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

/// Quantifiable physical property by an amount of an [Unit] of one of its [SystemOfMeasurent].
///
/// Represented with a [kind] description, a collection of [SystemOfMeasurent] instances.
/// Provides an API to return an unit by its symbol from any of its systems of measurement.
abstract class PhysicalProperty {
  PhysicalProperty({required this.kind}) : systemsOfMeasurent = [];

  final String kind;
  final List<SystemOfMeasurent> systemsOfMeasurent;

  /// Return the baseUnit of my first SystemOfMeasurement
  Unit get baseUnit => systemsOfMeasurent[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  List<Unit> get unitList => systemsOfMeasurent
      .fold([], (list, systemOfMeasure) => list..addAll(systemOfMeasure.units));

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  Unit? unitWith({required String symbol}) {
    Unit? unit;
    try {
      systemsOfMeasurent.firstWhere((systemOfMeasure) {
        unit ??= systemOfMeasure.unitWith(symbol: symbol);
        return unit != null;
      });
    } on StateError {
      unit = null;
    }
    return unit;
  }

  @override
  bool operator ==(Object other) =>
      other is PhysicalProperty && kind == other.kind;

  @override
  int get hashCode => kind.hashCode;

  @override
  String toString() => kind;
}

/// Unit of a physical property.
///
/// Expressed with a [symbol] in a [systemOfMeasurement] for its kind of [PhysicalProperty] (volume, mass, legnth, etc).
/// Provides access to a [QuantityConverter] to another [Unit] of the same kind of [PhysicalProperty].
class Unit extends Equatable {
  const Unit(this.systemOfMeasurent, this.symbol, this.name);

  final SystemOfMeasurent systemOfMeasurent;
  final String symbol;
  final String name;

  PhysicalProperty get kind => systemOfMeasurent.kind;

  /// Compare if another unit is of the same kind
  bool sameKind(Unit unit) =>
      systemOfMeasurent.sameKind(unit.systemOfMeasurent);

  /// Compose a QuantityConverter function to convert amounts to another unit.
  QuantityConverter quantityConverterTo(Unit anotherUnit) {
    if (systemOfMeasurent == anotherUnit.systemOfMeasurent) {
      return systemOfMeasurent.quantityConverter(
          fromUnit: this, toUnit: anotherUnit);
    }
    final anotherFromBaseUnitConverter =
        anotherUnit.systemOfMeasurent.baseUnit.quantityConverterTo(anotherUnit);
    final thisToBaseConverter = quantityConverterTo(systemOfMeasurent.baseUnit);
    final baseToAnotherBaseConver =
        systemOfMeasurent.baseUnitConverterTo(anotherUnit.systemOfMeasurent);
    return (quantity) => anotherFromBaseUnitConverter(
        baseToAnotherBaseConver(thisToBaseConverter(quantity)));
  }

  @override
  List<Object> get props =>
      [systemOfMeasurent.kind, systemOfMeasurent.name, symbol, name];
}

/// Interface for unit conversion.
///
/// Exposes an abstract QuantityConverter getter.
abstract class UnitConverter {
  UnitConverter();

  QuantityConverter quantityConverter(
      {required Unit fromUnit, required Unit toUnit});
}

/// Exception class for incompatible unit conversion.
class IncompatibleUnitsException implements Exception {
  const IncompatibleUnitsException(this.anUnit, this.anotherUnit);

  final Unit anUnit;
  final Unit anotherUnit;

  @override
  String toString() =>
      'Incompatible units "${anUnit.kind}" and "${anotherUnit.kind}"';
}
