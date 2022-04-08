import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Mass physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Mass] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Mass extends PhysicalProperty<Mass> {
  factory Mass() => _instance ??= Mass._();

  Mass._() : super(kind: 'mass');

  static Mass? _instance;

  static Quantity<Mass> milligrams(double amount) =>
      Quantity(unit: Mass().milligram, amount: amount);
  static Quantity<Mass> grams(double amount) => Quantity(unit: Mass().gram, amount: amount);
  static Quantity<Mass> kilograms(double amount) => Quantity(unit: Mass().kilogram, amount: amount);
  static Quantity<Mass> tons(double amount) => Quantity(unit: Mass().ton, amount: amount);
  static Quantity<Mass> ounces(double amount) => Quantity(unit: Mass().ounce, amount: amount);
  static Quantity<Mass> pounds(double amount) => Quantity(unit: Mass().pound, amount: amount);
  static Quantity<Mass> stones(double amount) => Quantity(unit: Mass().stone, amount: amount);
  static Quantity<Mass> quarters(double amount) => Quantity(unit: Mass().quarter, amount: amount);

  late Unit<Mass> gram;
  late Unit<Mass> kilogram;
  late Unit<Mass> milligram;
  late Unit<Mass> ton;
  late Unit<Mass> ounce;
  late Unit<Mass> pound;
  late Unit<Mass> stone;
  late Unit<Mass> quarter;

  @override
  void defineUnits() {
    final si = InternationalSystemOfUnits<Mass>(kind: this);
    kilogram = si.defineBaseUnit(symbol: 'kg', name: 'kilogram', factor: 1.0);
    milligram = si.defineUnit(symbol: 'mg', name: 'milligram', factor: 0.000001);
    gram = si.defineUnit(symbol: 'g', name: 'gram', factor: 0.001);
    ton = si.defineUnit(symbol: 't', name: 'ton', factor: 1000.0);

    final imperial = ImperialSystemOfUnits<Mass>(kind: this);
    pound = imperial.defineBaseUnit(symbol: 'lb', name: 'pound', factor: 0.45359237);
    ounce = imperial.defineUnit(symbol: 'oz', name: 'ounce', factor: 1.0 / 16.0);
    stone = imperial.defineUnit(symbol: 'st', name: 'stone', factor: 14.0);
    quarter = imperial.defineUnit(symbol: 'qr', name: 'quarter', factor: 28.0);

    systemsOfUnits.addAll([si, imperial]);
  }
}
