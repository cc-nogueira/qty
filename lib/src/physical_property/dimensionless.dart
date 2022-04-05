import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Dimensionless property.
///
/// Dimensionless with FixedSystemOfUnits.
class Dimensionless extends PhysicalProperty {
  factory Dimensionless() => _instance ??= Dimensionless._('unit');

  Dimensionless._(String kind) : super(kind: kind) {
    _fixedSystem = FixedSystemOfUnits(kind: this);
    _fixedSystem.defineBaseUnit(symbol: 'un', name: 'unit', factor: 1.0);

    systemsOfMeasurent.addAll([_fixedSystem]);
  }

  static Dimensionless? _instance;
  late FixedSystemOfUnits _fixedSystem;

  static Quantity units({required double amount}) =>
      Quantity(unit: un, amount: amount);
  static Unit get un => Dimensionless().unUnit;

  Unit get unUnit => _fixedSystem.unitWith(symbol: 'un')!;
}
