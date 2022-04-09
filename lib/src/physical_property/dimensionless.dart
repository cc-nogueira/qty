import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Dimensionless property.
///
/// Dimensionless with FixedSystemOfUnits.
class Dimensionless extends PhysicalProperty<Dimensionless> {
  factory Dimensionless() => _instance ??= Dimensionless._();
  Dimensionless._() : super(kind: 'unit', symbol: '');

  static Dimensionless? _instance;

  late final Unit<Dimensionless> un;

  static Quantity<Dimensionless> units(amount) =>
      Quantity(unit: Dimensionless().un, amount: amount);

  @override
  void defineUnits() {
    final fixedSystem = FixedSystemOfUnits<Dimensionless>(kind: this);
    un = fixedSystem.defineBaseUnit(symbol: 'un', name: 'unit', factor: 1.0);

    systemsOfUnits.addAll([fixedSystem]);
  }
}
