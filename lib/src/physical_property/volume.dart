import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';

/// Volume physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Volume] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Volume extends PowersPhysicalProperty<Volume, Length> {
  factory Volume() => _instance ??= Volume._();

  Volume._() : super(Length(), 3, kind: 'volume', dimensionSymbol: 'L³', quantitySymbol: 'v');

  static Volume? _instance;

  late final PowersSystemOfUnits<Volume, Length> systemOfUnits;

  // SI
  late final cubicMillimeter =
      systemOfUnits.definePowersUnit(symbol: 'mm³', name: 'cubic millimeter');
  late final cubicCentimeter =
      systemOfUnits.definePowersUnit(symbol: 'cm³', name: 'cubic centimeter');
  late final cubicDecimeter =
      systemOfUnits.definePowersUnit(symbol: 'dm³', name: 'cubic decimeter');
  late final cubicMeter = systemOfUnits.definePowersUnit(symbol: 'm³', name: 'cubic meter');
  late final milliliter =
      systemOfUnits.definePowersUnit(symbol: 'ml', name: 'milliliter', baseUnit: 'cm');
  late final centiliter = systemOfUnits.definePowersUnit(
      symbol: 'cl', name: 'centiliter', baseUnit: 'dm', factor: 1e-2);
  late final deciliter =
      systemOfUnits.definePowersUnit(symbol: 'dl', name: 'deciliter', baseUnit: 'dm', factor: 1e-1);
  late final liter = systemOfUnits.definePowersUnit(symbol: 'l', name: 'liter', baseUnit: 'dm');

  // Imperial/US
  late final cubicInch = systemOfUnits.definePowersUnit(symbol: 'in³', name: 'cubic inch');
  late final cubicFoot = systemOfUnits.definePowersUnit(symbol: 'ft³', name: 'cubic foot');
  late final cubicYard = systemOfUnits.definePowersUnit(symbol: 'yd³', name: 'cubic yard');
  late final cubicMile = systemOfUnits.definePowersUnit(symbol: 'mi³', name: 'cubic mile');

  // US
  late final gallonUS = systemOfUnits.definePowersUnit(
      symbol: 'gal US', name: 'gallon US', baseUnit: 'in', factor: 231);
  late final fluidOunceUS = systemOfUnits.definePowersUnit(
      symbol: 'fl oz US', name: 'fluid ounce US', baseUnit: 'in', factor: 231.0 / 160.0);
  late final gillUS = systemOfUnits.definePowersUnit(
      symbol: 'gi US', name: 'gill US', baseUnit: 'in', factor: 231.0 / 32.0);
  late final pintUS = systemOfUnits.definePowersUnit(
      symbol: 'pt US', name: 'pint US', baseUnit: 'in', factor: 231.0 / 8.0);
  late final quartUS = systemOfUnits.definePowersUnit(
      symbol: 'qt US', name: 'quart US', baseUnit: 'in', factor: 231.0 / 4.0);
  late final peckUS = systemOfUnits.definePowersUnit(
      symbol: 'peck US', name: 'peck US', baseUnit: 'in', factor: 4.0 * 231.0);
  late final bushelUS = systemOfUnits.definePowersUnit(
      symbol: 'bu US', name: 'bushel US', baseUnit: 'in', factor: 8.0 * 231.0);
  late final quarterUS = systemOfUnits.definePowersUnit(
      symbol: 'qr US', name: 'quarter US', baseUnit: 'in', factor: 64.0 * 231.0);
  late final oilBarrel = systemOfUnits.definePowersUnit(
      symbol: 'oil barrel', name: 'oil barrel', baseUnit: 'in', factor: 42.0 * 231.0);

  // Imperial
  late final gallonUK = systemOfUnits.definePowersUnit(
      symbol: 'gal UK', name: 'gallon UK', baseUnit: 'dm', factor: 4.54609);
  late final fluidOunceUK = systemOfUnits.definePowersUnit(
      symbol: 'fl oz UK', name: 'fluid ounce', baseUnit: 'dm', factor: 4.54609 / 160.0);
  late final gillUK = systemOfUnits.definePowersUnit(
      symbol: 'gi UK', name: 'gill UK', baseUnit: 'dm', factor: 4.54609 / 32.0);
  late final pintUK = systemOfUnits.definePowersUnit(
      symbol: 'pt UK', name: 'pint UK', baseUnit: 'dm', factor: 4.54609 / 8.0);
  late final quartUK = systemOfUnits.definePowersUnit(
      symbol: 'qt UK', name: 'quart UK', baseUnit: 'dm', factor: 4.54609 / 4.0);
  late final peckUK = systemOfUnits.definePowersUnit(
      symbol: 'peck UK', name: 'peck UK', baseUnit: 'dm', factor: 2.0 * 4.54609);
  late final bushelUK = systemOfUnits.definePowersUnit(
      symbol: 'bu UK', name: 'bushel UK', baseUnit: 'dm', factor: 8.0 * 4.54609);
  late final quarterUK = systemOfUnits.definePowersUnit(
      symbol: 'qr UK', name: 'quarter UK', baseUnit: 'dm', factor: 64.0 * 4.54609);

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
  void defineSystemsOfUnits() {
    systemOfUnits = PowersSystemOfUnits<Volume, Length>(this, power: 3);
    systemsOfUnits.addAll([systemOfUnits]);
  }

  @override
  void loadAllUnits() {
    // SI
    liter;

    deciliter;
    centiliter;
    milliliter;

    cubicMillimeter;
    cubicCentimeter;
    cubicDecimeter;
    cubicMeter;

    // Imperial/US
    cubicFoot;

    cubicInch;
    cubicYard;
    cubicMile;

    // US
    gallonUS;

    fluidOunceUS;
    gillUS;
    pintUS;
    quartUS;
    peckUS;
    bushelUS;
    quarterUS;
    oilBarrel;

    // Imperial
    gallonUK;

    fluidOunceUK;
    gillUK;
    pintUK;
    quartUK;
    peckUK;
    bushelUK;
    quarterUK;
  }
}
