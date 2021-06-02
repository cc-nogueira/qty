import '../measurement/measurement.dart';
import '../measurement/systems_of_units.dart';
import '../quantity/quantity.dart';

/// Dimensionless property.
///
/// Configures Internation Systems of Units(SI) dimensionless [Unit] instance.
class Dimensionless extends PhysicalProperty {
  factory Dimensionless() => _instance ??= Dimensionless._internal('unit');

  Dimensionless._internal(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(symbol: 'un', name: 'unit', factor: 1.0);

    systemsOfMeasurent.addAll([_internationalSystemOfUnits]);
  }

  static Dimensionless? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;

  static Quantity units({required double amount}) => Quantity(unit: un, amount: amount);
  static Unit get un => Dimensionless().unUnit;

  Unit get unUnit => _internationalSystemOfUnits.unitWith(symbol: 'un')!;
}
