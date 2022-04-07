import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// NamedProperty.
///
/// NamedProperty with FixedSystemOfUnits.
class NamedProperty extends PhysicalProperty<NamedProperty> {
  factory NamedProperty(String name) => _instances.putIfAbsent(name, () => NamedProperty._(name));

  NamedProperty._(String name) : super(kind: name) {
    _fixedSystem = FixedSystemOfUnits<NamedProperty>(kind: this);
    _fixedSystem.defineBaseUnit(symbol: name, name: name, factor: 1.0);

    systemsOfUnits.addAll([_fixedSystem]);
  }

  static final Map<String, NamedProperty> _instances = {};
  late FixedSystemOfUnits<NamedProperty> _fixedSystem;

  static Quantity<NamedProperty> units({required String name, required double amount}) =>
      Quantity(unit: unit(name), amount: amount);

  static Unit<NamedProperty> unit(String name) => NamedProperty(name).namedUnit;

  Unit<NamedProperty> get namedUnit => _fixedSystem.unitWith(symbol: kind)!;
}
