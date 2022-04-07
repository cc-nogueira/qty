import 'systems_of_units.dart';
import 'unit.dart';

/// Quantifiable physical property by an amount of an [Unit] of one of its [SystemOfMeasurent]s.
///
/// Represented with a [kind] description and a collection of [SystemOfMeasurent] instances.
/// Provides an API to return an unit by its symbol from any of its systems of measurement.
abstract class PhysicalProperty {
  PhysicalProperty({required this.kind}) : systemsOfMeasurent = [];

  // Texttual name for this PhysicalProperty
  final String kind;

  // Collection of SystemOfMeasurement for this PhysicalProperty
  final List<SystemOfMeasurent> systemsOfMeasurent;

  /// Return the baseUnit of my first SystemOfMeasurement
  Unit get baseUnit => systemsOfMeasurent[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  List<Unit> get unitList =>
      systemsOfMeasurent.fold([], (list, systemOfMeasure) => list..addAll(systemOfMeasure.units));

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
  bool operator ==(Object other) => other is PhysicalProperty && kind == other.kind;

  @override
  int get hashCode => kind.hashCode;

  @override
  String toString() => kind;
}

/// Abstract class for all LinearConvertible Physical Properties.
///
/// Defines common api for most Physical Properties, those whose units are
/// linerarly convertible (proportional conversions). Ex.: Length, Mass, Times, etc.
///
/// Most methods are redifened just to return a covariant types.
abstract class LinearConvertiblePhysicalProperty extends PhysicalProperty {
  LinearConvertiblePhysicalProperty({required String kind}) : super(kind: kind);

  @override
  List<LinearConvertibleSystemOfUnits> get systemsOfMeasurent =>
      super.systemsOfMeasurent.cast<LinearConvertibleSystemOfUnits>();

  /// Return the baseUnit of my first SystemOfMeasurement
  @override
  LinearConvertibleUnit get baseUnit => systemsOfMeasurent[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  @override
  List<LinearConvertibleUnit> get unitList =>
      systemsOfMeasurent.fold([], (list, systemOfMeasure) => list..addAll(systemOfMeasure.units));

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  @override
  LinearConvertibleUnit? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as LinearConvertibleUnit?;
}

/// Exception class for incompatible unit conversion.
class IncompatibleUnitsException implements Exception {
  const IncompatibleUnitsException(this.anUnit, this.anotherUnit);

  final Unit anUnit;
  final Unit anotherUnit;

  @override
  String toString() => 'Incompatible units "${anUnit.kind}" and "${anotherUnit.kind}"';
}
