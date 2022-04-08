import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Volume physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Volume] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Volume extends PhysicalProperty<Volume> {
  factory Volume() => _instance ??= Volume._();

  Volume._() : super(kind: 'volume');

  static Volume? _instance;

  late Unit<Volume> cubicMillimeter;
  late Unit<Volume> cubicCentimeter;
  late Unit<Volume> cubicDecimeter;
  late Unit<Volume> cubicMeter;
  late Unit<Volume> milliliter;
  late Unit<Volume> centiliter;
  late Unit<Volume> deciliter;
  late Unit<Volume> liter;

  late Unit<Volume> gallon;
  late Unit<Volume> fluidOunce;
  late Unit<Volume> gill;
  late Unit<Volume> pint;
  late Unit<Volume> quart;
  late Unit<Volume> peck;
  late Unit<Volume> bushel;
  late Unit<Volume> quarter;

  static Quantity<Volume> cubicMillimeters(double amount) =>
      Quantity(unit: Volume().cubicMillimeter, amount: amount);

  static Quantity<Volume> cubicCentimeters(double amount) =>
      Quantity(unit: Volume().cubicCentimeter, amount: amount);

  static Quantity<Volume> cubicDecimeters(double amount) =>
      Quantity(unit: Volume().cubicDecimeter, amount: amount);

  static Quantity<Volume> cubicMeters(double amount) =>
      Quantity(unit: Volume().cubicMeter, amount: amount);

  static Quantity<Volume> milliliters(double amount) =>
      Quantity(unit: Volume().milliliter, amount: amount);

  static Quantity<Volume> centiliters(double amount) =>
      Quantity(unit: Volume().centiliter, amount: amount);

  static Quantity<Volume> deciliters(double amount) =>
      Quantity(unit: Volume().deciliter, amount: amount);

  static Quantity<Volume> liters(double amount) => Quantity(unit: Volume().liter, amount: amount);

  static Quantity<Volume> gallons(double amount) => Quantity(unit: Volume().gallon, amount: amount);

  static Quantity<Volume> ounces(double amount) =>
      Quantity(unit: Volume().fluidOunce, amount: amount);

  static Quantity<Volume> gills(double amount) => Quantity(unit: Volume().gill, amount: amount);

  static Quantity<Volume> pints(double amount) => Quantity(unit: Volume().pint, amount: amount);

  static Quantity<Volume> quarts(double amount) => Quantity(unit: Volume().quart, amount: amount);

  static Quantity<Volume> pecks(double amount) => Quantity(unit: Volume().peck, amount: amount);

  static Quantity<Volume> bushels(double amount) => Quantity(unit: Volume().bushel, amount: amount);

  static Quantity<Volume> quarters(double amount) =>
      Quantity(unit: Volume().quarter, amount: amount);

  @override
  void defineUnits() {
    final si = InternationalSystemOfUnits<Volume>(kind: this);
    liter = si.defineBaseUnit(symbol: 'l', name: 'liter', factor: 1.0);
    cubicMillimeter = si.defineUnit(symbol: 'mm3', name: 'cubic millimeter', factor: 0.000001);
    cubicCentimeter = si.defineUnit(symbol: 'cm3', name: 'cubic centimeter', factor: 0.001);
    cubicDecimeter = si.defineUnit(symbol: 'dm3', name: 'cubic decimeter', factor: 1.0);
    cubicMeter = si.defineUnit(symbol: 'm3', name: 'cubic meter', factor: 1000.0);
    milliliter = si.defineUnit(symbol: 'ml', name: 'milliliter', factor: 0.001);
    centiliter = si.defineUnit(symbol: 'cl', name: 'centiliter', factor: 0.01);
    deciliter = si.defineUnit(symbol: 'dl', name: 'deciliter', factor: 0.1);

    final imperial = ImperialSystemOfUnits<Volume>(kind: this);
    gallon = imperial.defineBaseUnit(symbol: 'gal', name: 'gallon', factor: 4.54609);
    fluidOunce = imperial.defineUnit(symbol: 'fl oz', name: 'fluid ounce', factor: 1.0 / 160.0);
    gill = imperial.defineUnit(symbol: 'gi', name: 'gill', factor: 1.0 / 32.0);
    pint = imperial.defineUnit(symbol: 'pt', name: 'pint', factor: 1.0 / 8.0);
    quart = imperial.defineUnit(symbol: 'qt', name: 'quart', factor: 1.0 / 4.0);
    peck = imperial.defineUnit(symbol: 'peck', name: 'peck', factor: 2.0);
    bushel = imperial.defineUnit(symbol: 'bu', name: 'bushel', factor: 8.0);
    quarter = imperial.defineUnit(symbol: 'qr', name: 'quarter', factor: 64.0);

    systemsOfUnits.addAll([si, imperial]);
  }
}
