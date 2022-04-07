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
    _fixedSystem = FixedSystemOfUnits<Dimensionless>(kind: this);
    _fixedSystem.defineBaseUnit(symbol: 'un', name: 'unit', factor: 1.0);

    systemsOfMeasurement.addAll([_fixedSystem]);
  }

  static Dimensionless? _instance;
  late FixedSystemOfUnits<Dimensionless> _fixedSystem;

  static Quantity<Dimensionless> units({required double amount}) =>
      Quantity(unit: un, amount: amount);

  static Unit<Dimensionless> get un => Dimensionless().unUnit;

  Unit<Dimensionless> get unUnit => _fixedSystem.unitWith(symbol: 'un')!;
}
