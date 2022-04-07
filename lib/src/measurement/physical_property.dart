import '../../qty.dart';
import 'systems_of_units.dart';
import 'unit.dart';

abstract class Kind {
  const Kind(this.kind);

  // Texttual name for this PhysicalProperty
  final String kind;

  @override
  bool operator ==(Object other) =>
      other is Kind && other.runtimeType == runtimeType && kind == other.kind;

  @override
  int get hashCode => kind.hashCode;

  @override
  String toString() => kind;
}

/// Quantifiable physical property by an amount of an [Unit] of one of its [SystemOfMeasurement]s.
///
/// Represented with a [kind] description and a collection of [SystemOfMeasurement] instances.
/// Provides an API to return an unit by its symbol from any of its systems of measurement.

abstract class PhysicalProperty<K extends Kind> extends Kind {
  PhysicalProperty({required String kind}) : super(kind);

  // Collection of SystemOfMeasurement for this PhysicalProperty
  final List<SystemOfMeasurement<K>> systemsOfMeasurement = [];

  /// Return the baseUnit of my first SystemOfMeasurement
  Unit<K> get baseUnit => systemsOfMeasurement[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  List<Unit<K>> get unitList =>
      systemsOfMeasurement.fold([], (list, systemOfMeasure) => list..addAll(systemOfMeasure.units));

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  Unit<K>? unitWith({required String symbol}) {
    Unit<K>? unit;
    try {
      systemsOfMeasurement.firstWhere((systemOfMeasure) {
        unit ??= systemOfMeasure.unitWith(symbol: symbol);
        return unit != null;
      });
    } on StateError {
      unit = null;
    }
    return unit;
  }
}

/// Abstract class for all LinearConvertible Physical Properties.
///
/// Defines common api for most Physical Properties, those whose units are
/// linerarly convertible (proportional conversions). Ex.: Length, Mass, Times, etc.
///
/// Most methods are redifened just to return a covariant types.
abstract class LinearConvertiblePhysicalProperty<K extends LinearConvertiblePhysicalProperty<K>>
    extends PhysicalProperty<K> {
  LinearConvertiblePhysicalProperty({required String kind}) : super(kind: kind);

  @override
  List<LinearConvertibleSystemOfUnits<K>> get systemsOfMeasurement =>
      super.systemsOfMeasurement.cast<LinearConvertibleSystemOfUnits<K>>();

  /// Return the baseUnit of my first SystemOfMeasurement
  @override
  LinearConvertibleUnit<K> get baseUnit => systemsOfMeasurement[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  @override
  List<LinearConvertibleUnit<K>> get unitList =>
      systemsOfMeasurement.fold([], (list, systemOfMeasure) => list..addAll(systemOfMeasure.units));

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  @override
  LinearConvertibleUnit<K>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as LinearConvertibleUnit<K>?;
}

/// Exception class for incompatible unit conversion.
class IncompatibleUnitsException implements Exception {
  const IncompatibleUnitsException(this.anUnit, this.anotherUnit);

  final Unit anUnit;
  final Unit anotherUnit;

  @override
  String toString() => 'Incompatible units "${anUnit.kind}" and "${anotherUnit.kind}"';
}
