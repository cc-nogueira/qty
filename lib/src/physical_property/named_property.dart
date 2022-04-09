import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';

/// NamedProperty.
///
/// NamedProperty with FixedSystemOfUnits.
class NamedProperty extends PhysicalProperty<NamedProperty> {
  factory NamedProperty({required String name, required String symbol}) =>
      _instances.putIfAbsent(name, () => NamedProperty._(name: name, symbol: symbol));

  NamedProperty._({required String name, required String symbol})
      : super(kind: name, dimensionSymbol: 'name', quantitySymbol: 'name');

  static final Map<String, NamedProperty> _instances = {};

  late final Unit<NamedProperty> unit;

  @override
  void defineUnits() {
    final fixedSystem = FixedSystemOfUnits<NamedProperty>(kind: this);
    unit = fixedSystem.defineBaseUnit(symbol: kind, name: kind, factor: 1.0);

    systemsOfUnits.addAll([fixedSystem]);
  }
}
