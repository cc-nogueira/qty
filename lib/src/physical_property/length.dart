import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Length physical property singleton.
///
/// Configures Internation (SI), Imperial (British) and Nautical systems of units defining their [Length] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Length extends PhysicalProperty<Length> {
  factory Length() => _instance ??= Length._();
  Length._() : super(kind: 'length');

  static Length? _instance;

  late Unit<Length> picometer;
  late Unit<Length> micrometer;
  late Unit<Length> millimiter;
  late Unit<Length> centimeter;
  late Unit<Length> decimeter;
  late Unit<Length> meter;
  late Unit<Length> kilometer;
  late Unit<Length> inch;
  late Unit<Length> foot;
  late Unit<Length> yard;
  late Unit<Length> fathom;
  late Unit<Length> mile;
  late Unit<Length> nauticalMile;

  static Quantity<Length> picometers(double amount) =>
      Quantity(unit: Length().picometer, amount: amount);
  static Quantity<Length> millimeters(double amount) =>
      Quantity(unit: Length().millimiter, amount: amount);
  static Quantity<Length> centimeters(double amount) =>
      Quantity(unit: Length().centimeter, amount: amount);
  static Quantity<Length> decimeters(double amount) =>
      Quantity(unit: Length().decimeter, amount: amount);
  static Quantity<Length> meters(double amount) => Quantity(unit: Length().meter, amount: amount);
  static Quantity<Length> kilometers(double amount) =>
      Quantity(unit: Length().kilometer, amount: amount);

  static Quantity<Length> inches(double amount) => Quantity(unit: Length().inch, amount: amount);
  static Quantity<Length> feet(double amount) => Quantity(unit: Length().foot, amount: amount);
  static Quantity<Length> yards(double amount) => Quantity(unit: Length().yard, amount: amount);
  static Quantity<Length> fathoms(double amount) => Quantity(unit: Length().fathom, amount: amount);
  static Quantity<Length> miles(double amount) => Quantity(unit: Length().mile, amount: amount);

  static Quantity<Length> nauticalMiles(double amount) =>
      Quantity(unit: Length().nauticalMile, amount: amount);

  @override
  void defineUnits() {
    final si = InternationalSystemOfUnits<Length>(kind: this);
    meter = si.defineBaseUnit(symbol: 'm', name: 'meter', factor: 1.0);
    picometer = si.defineUnit(symbol: 'pm', name: 'picometer', factor: 0.000000000001);
    micrometer = si.defineUnit(symbol: 'micro', name: 'micrometer', factor: 0.000001);
    millimiter = si.defineUnit(symbol: 'mm', name: 'millimeter', factor: 0.001);
    centimeter = si.defineUnit(symbol: 'cm', name: 'centimeter', factor: 0.01);
    decimeter = si.defineUnit(symbol: 'dm', name: 'decimeter', factor: 0.1);
    kilometer = si.defineUnit(symbol: 'km', name: 'kilometer', factor: 1000.0);

    final imperial = ImperialSystemOfUnits<Length>(kind: this);
    foot = imperial.defineBaseUnit(symbol: 'ft', name: 'foot', factor: 0.3048);
    inch = imperial.defineUnit(symbol: 'in', name: 'inch', factor: 1.0 / 12.0);
    yard = imperial.defineUnit(symbol: 'yd', name: 'yard', factor: 3.0);
    fathom = imperial.defineUnit(symbol: 'fa', name: 'fathom', factor: 6.0);
    mile = imperial.defineUnit(symbol: 'mi', name: 'mile', factor: 5280.0);

    final nautical = NauticalSystemOfUnits<Length>(kind: this);
    nauticalMile = nautical.defineBaseUnit(symbol: 'nm', name: 'nautical mile', factor: 1852.0);

    systemsOfUnits.addAll([si, imperial, nautical]);
  }
}
