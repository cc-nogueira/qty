import '../../qty.dart';
import 'systems_of_units.dart';
import 'unit.dart';

/// Quantifiable physical property by an amount of an [Unit] of one of its [SystemOfUnits]s.
///
/// Dome other common names for PhysicalProperty is Dimension.
///
/// Represented with a [kind] description and a collection of [SystemOfUnits] instances.
/// Provides an API to return an unit by its symbol from any of its systems of measurement.
abstract class PhysicalProperty<T extends PhysicalProperty<T>> {
  PhysicalProperty(
      {required this.kind, required this.dimensionSymbol, required this.quantitySymbol}) {
    defineUnits();
  }

  // Texttual name for this PhysicalProperty
  final String kind;

  // Dimension symbol
  final String dimensionSymbol;

  // Qunatity symbol
  final String quantitySymbol;

  // Collection of SystemOfMeasurement for this PhysicalProperty
  final List<SystemOfUnits<T>> systemsOfUnits = [];

  // Method called by the constructor to define subclass units.
  void defineUnits();

  /// Return the baseUnit of my first SystemOfMeasurement
  Unit<T> get baseUnit => systemsOfUnits[0].baseUnit;

  /// Return all units in all of my SystemOfMeasurement list
  List<Unit<T>> get unitList =>
      systemsOfUnits.fold([], (list, system) => list..addAll(system.units));

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  Unit<T>? unitWith({required String symbol}) {
    Unit<T>? unit;
    try {
      systemsOfUnits.firstWhere((system) {
        unit ??= system.unitWith(symbol: symbol);
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

/// Exception class for incompatible unit conversion.
class IncompatibleUnitsException implements Exception {
  const IncompatibleUnitsException(this.anUnit, this.anotherUnit);

  final Unit anUnit;
  final Unit anotherUnit;

  @override
  String toString() => 'Incompatible units "${anUnit.kind}" and "${anotherUnit.kind}"';
}
