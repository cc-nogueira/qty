import '../measurement/measurement.dart';
import '../measurement/systems_of_units.dart';
import '../quantity/quantity.dart';

/// Dimensionless property.
///
/// Configures Internation Systems of Units(SI) dimensionless [Unit] instance.
class NamedProperty extends PhysicalProperty {
  factory NamedProperty(String name) =>
      _instances.putIfAbsent(name, () => NamedProperty._internal(name));

  NamedProperty._internal(String name) : super(kind: name) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(
        symbol: name, name: name, factor: 1.0);

    systemsOfMeasurent.addAll([_internationalSystemOfUnits]);
  }

  static final Map<String, NamedProperty> _instances = {};
  late InternationalSystemOfUnits _internationalSystemOfUnits;

  static Quantity units({required String name, required double amount}) =>
      Quantity(unit: unit(name), amount: amount);
  static Unit unit(String name) => NamedProperty(name).namedUnit;

  Unit get namedUnit => _internationalSystemOfUnits.unitWith(symbol: kind)!;
}
