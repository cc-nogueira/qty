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

  // SI
  late Unit<Volume> cubicMillimeter;
  late Unit<Volume> cubicCentimeter;
  late Unit<Volume> cubicDecimeter;
  late Unit<Volume> cubicMeter;
  late Unit<Volume> milliliter;
  late Unit<Volume> centiliter;
  late Unit<Volume> deciliter;
  late Unit<Volume> liter;

  // Imperial/US
  late Unit<Volume> cubicInch;
  late Unit<Volume> cubicFoot;
  late Unit<Volume> cubicYard;
  late Unit<Volume> cubicMile;

  // US
  late Unit<Volume> gallonUS;
  late Unit<Volume> fluidOunceUS;
  late Unit<Volume> gillUS;
  late Unit<Volume> pintUS;
  late Unit<Volume> quartUS;
  late Unit<Volume> peckUS;
  late Unit<Volume> bushelUS;
  late Unit<Volume> quarterUS;
  late Unit<Volume> oilBarrel;

  // Imperial
  late Unit<Volume> gallonUK;
  late Unit<Volume> fluidOunceUK;
  late Unit<Volume> gillUK;
  late Unit<Volume> pintUK;
  late Unit<Volume> quartUK;
  late Unit<Volume> peckUK;
  late Unit<Volume> bushelUK;
  late Unit<Volume> quarterUK;

  // SI
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

  // Imperial/US
  static Quantity<Volume> cubicInches(double amount) =>
      Quantity(unit: Volume().cubicInch, amount: amount);
  static Quantity<Volume> cubicFeet(double amount) =>
      Quantity(unit: Volume().cubicFoot, amount: amount);
  static Quantity<Volume> cubicYards(double amount) =>
      Quantity(unit: Volume().cubicYard, amount: amount);
  static Quantity<Volume> cubicMiles(double amount) =>
      Quantity(unit: Volume().cubicMile, amount: amount);

  // US
  static Quantity<Volume> gallonsUS(double amount) =>
      Quantity(unit: Volume().gallonUS, amount: amount);
  static Quantity<Volume> fluidOuncesUS(double amount) =>
      Quantity(unit: Volume().fluidOunceUS, amount: amount);
  static Quantity<Volume> gillsUS(double amount) => Quantity(unit: Volume().gillUS, amount: amount);
  static Quantity<Volume> pintsUS(double amount) => Quantity(unit: Volume().pintUS, amount: amount);
  static Quantity<Volume> quartsUS(double amount) =>
      Quantity(unit: Volume().quartUS, amount: amount);
  static Quantity<Volume> pecksUS(double amount) => Quantity(unit: Volume().peckUS, amount: amount);
  static Quantity<Volume> bushelsUS(double amount) =>
      Quantity(unit: Volume().bushelUS, amount: amount);
  static Quantity<Volume> quartersUS(double amount) =>
      Quantity(unit: Volume().quarterUS, amount: amount);
  static Quantity<Volume> oilBarrels(double amount) =>
      Quantity(unit: Volume().oilBarrel, amount: amount);

  // Imperial
  static Quantity<Volume> gallonsUK(double amount) =>
      Quantity(unit: Volume().gallonUK, amount: amount);
  static Quantity<Volume> ouncesUK(double amount) =>
      Quantity(unit: Volume().fluidOunceUK, amount: amount);
  static Quantity<Volume> gillsUK(double amount) => Quantity(unit: Volume().gillUK, amount: amount);
  static Quantity<Volume> pintsUK(double amount) => Quantity(unit: Volume().pintUK, amount: amount);
  static Quantity<Volume> quartsUK(double amount) =>
      Quantity(unit: Volume().quartUK, amount: amount);
  static Quantity<Volume> pecksUK(double amount) => Quantity(unit: Volume().peckUK, amount: amount);
  static Quantity<Volume> bushelsUK(double amount) =>
      Quantity(unit: Volume().bushelUK, amount: amount);
  static Quantity<Volume> quartersUK(double amount) =>
      Quantity(unit: Volume().quarterUK, amount: amount);

  @override
  void defineUnits() {
    // SI
    final si = InternationalSystemOfUnits<Volume>(kind: this);
    liter = si.defineBaseUnit(symbol: 'l', name: 'liter', factor: 1.0);

    deciliter = si.defineUnit(symbol: 'dl', name: 'deciliter', factor: 1e-1);
    centiliter = si.defineUnit(symbol: 'cl', name: 'centiliter', factor: 1e-2);
    milliliter = si.defineUnit(symbol: 'ml', name: 'milliliter', factor: 1e-3);

    cubicMillimeter = si.defineUnit(symbol: 'mm3', name: 'cubic millimeter', factor: 1e-6);
    cubicCentimeter = si.defineUnit(symbol: 'cm3', name: 'cubic centimeter', factor: 1e-3);
    cubicDecimeter = si.defineUnit(symbol: 'dm3', name: 'cubic decimeter', factor: 1.0);
    cubicMeter = si.defineUnit(symbol: 'm3', name: 'cubic meter', factor: 1e3);

    // Imperial/US
    final imperialUs = SystemOfUnits(name: 'Imperial/US System of Units', kind: this);
    cubicFoot = imperialUs.defineBaseUnit(symbol: 'ft3', name: 'cubic foot', factor: 28.31685);

    cubicInch = imperialUs.defineUnit(symbol: 'in3', name: 'cubic inch', factor: 1.0 / 1728.0);
    cubicYard = imperialUs.defineUnit(symbol: 'yd3', name: 'cubic yard', factor: 27.0);
    cubicMile = imperialUs.defineUnit(symbol: 'mi3', name: 'cubic mile', factor: 147197952000.0);

    // US
    final us = SystemOfUnits<Volume>(name: 'US System of Units', kind: this);
    gallonUS = us.defineBaseUnit(symbol: 'gal US', name: 'gallon US', factor: 3.785411784);

    fluidOunceUS = us.defineUnit(symbol: 'fl oz US', name: 'fluid ounce US', factor: 1.0 / 160.0);
    gillUS = us.defineUnit(symbol: 'gi US', name: 'gill US', factor: 1.0 / 32.0);
    pintUS = us.defineUnit(symbol: 'pt US', name: 'pint US', factor: 1.0 / 8.0);
    quartUS = us.defineUnit(symbol: 'qt US', name: 'quart US', factor: 1.0 / 4.0);
    peckUS = us.defineUnit(symbol: 'peck US', name: 'peck US', factor: 2.0);
    bushelUS = us.defineUnit(symbol: 'bu US', name: 'bushel US', factor: 8.0);
    quarterUS = us.defineUnit(symbol: 'qr US', name: 'quarter US', factor: 64.0);
    oilBarrel = us.defineUnit(symbol: 'oil barrel', name: 'oil barrel', factor: 42.0);

    // Imperial
    final imperial = SystemOfUnits<Volume>(name: 'Imperial System of Units', kind: this);
    gallonUK = imperial.defineBaseUnit(symbol: 'gal UK', name: 'gallon UK', factor: 4.54609);

    fluidOunceUK =
        imperial.defineUnit(symbol: 'fl oz UK', name: 'fluid ounce', factor: 1.0 / 160.0);
    gillUK = imperial.defineUnit(symbol: 'gi UK', name: 'gill UK', factor: 1.0 / 32.0);
    pintUK = imperial.defineUnit(symbol: 'pt UK', name: 'pint UK', factor: 1.0 / 8.0);
    quartUK = imperial.defineUnit(symbol: 'qt UK', name: 'quart UK', factor: 1.0 / 4.0);
    peckUK = imperial.defineUnit(symbol: 'peck UK', name: 'peck UK', factor: 2.0);
    bushelUK = imperial.defineUnit(symbol: 'bu UK', name: 'bushel UK', factor: 8.0);
    quarterUK = imperial.defineUnit(symbol: 'qr UK', name: 'quarter UK', factor: 64.0);

    systemsOfUnits.addAll([si, us, imperial]);
  }
}
