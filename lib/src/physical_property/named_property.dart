import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// NamedProperty.
///
/// NamedProperty with FixedSystemOfUnits.
class NamedProperty extends PhysicalProperty<NamedProperty> {
  factory NamedProperty(String name) => _instances.putIfAbsent(name, () => NamedProperty._(name));

  NamedProperty._(String name) : super(kind: name);

  static final Map<String, NamedProperty> _instances = {};

  late final Unit<NamedProperty> unit;

  static Quantity<NamedProperty> units({required String name, required double amount}) =>
      Quantity(unit: NamedProperty(name).unit, amount: amount);

  @override
  void defineUnits() {
    final fixedSystem = FixedSystemOfUnits<NamedProperty>(kind: this);
    unit = fixedSystem.defineBaseUnit(symbol: kind, name: kind, factor: 1.0);

    systemsOfUnits.addAll([fixedSystem]);
  }
}
