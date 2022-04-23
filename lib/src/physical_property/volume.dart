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

  Volume._()
      : super(Length(), power: 3, kind: 'volume', dimensionSymbol: 'L³', quantitySymbol: 'v');

  static Volume? _instance;

  late final PowersSystemOfUnits<Volume, Length> _systemOfUnits;

  // SI
  late final cubicMillimeter = _systemOfUnits.definePowersUnit(
      symbol: 'mm³', name: 'cubic millimeter', unit: Length().millimeter);
  late final cubicCentimeter = _systemOfUnits.definePowersUnit(
      symbol: 'cm³', name: 'cubic centimeter', unit: Length().centimeter);
  late final cubicDecimeter = _systemOfUnits.definePowersUnit(
      symbol: 'dm³', name: 'cubic decimeter', unit: Length().decimeter);
  late final cubicMeter =
      _systemOfUnits.definePowersUnit(symbol: 'm³', name: 'cubic meter', unit: Length().meter);
  late final milliliter =
      _systemOfUnits.definePowersUnit(symbol: 'ml', name: 'milliliter', unit: Length().centimeter);
  late final centiliter = _systemOfUnits.definePowersUnit(
      symbol: 'cl', name: 'centiliter', unit: Length().decimeter, factor: 1e-2);
  late final deciliter = _systemOfUnits.definePowersUnit(
      symbol: 'dl', name: 'deciliter', unit: Length().decimeter, factor: 1e-1);
  late final liter =
      _systemOfUnits.definePowersUnit(symbol: 'l', name: 'liter', unit: Length().decimeter);

  // Imperial/US
  late final cubicInch =
      _systemOfUnits.definePowersUnit(symbol: 'in³', name: 'cubic inch', unit: Length().inch);
  late final cubicFoot =
      _systemOfUnits.definePowersUnit(symbol: 'ft³', name: 'cubic foot', unit: Length().foot);
  late final cubicYard =
      _systemOfUnits.definePowersUnit(symbol: 'yd³', name: 'cubic yard', unit: Length().yard);
  late final cubicMile =
      _systemOfUnits.definePowersUnit(symbol: 'mi³', name: 'cubic mile', unit: Length().mile);

  // US
  late final gallonUS = _systemOfUnits.definePowersUnit(
      symbol: 'gal US', name: 'gallon US', unit: Length().inch, factor: 231);
  late final fluidOunceUS = _systemOfUnits.definePowersUnit(
      symbol: 'fl oz US', name: 'fluid ounce US', unit: Length().inch, factor: 231.0 / 160.0);
  late final gillUS = _systemOfUnits.definePowersUnit(
      symbol: 'gi US', name: 'gill US', unit: Length().inch, factor: 231.0 / 32.0);
  late final pintUS = _systemOfUnits.definePowersUnit(
      symbol: 'pt US', name: 'pint US', unit: Length().inch, factor: 231.0 / 8.0);
  late final quartUS = _systemOfUnits.definePowersUnit(
      symbol: 'qt US', name: 'quart US', unit: Length().inch, factor: 231.0 / 4.0);
  late final peckUS = _systemOfUnits.definePowersUnit(
      symbol: 'peck US', name: 'peck US', unit: Length().inch, factor: 4.0 * 231.0);
  late final bushelUS = _systemOfUnits.definePowersUnit(
      symbol: 'bu US', name: 'bushel US', unit: Length().inch, factor: 8.0 * 231.0);
  late final quarterUS = _systemOfUnits.definePowersUnit(
      symbol: 'qr US', name: 'quarter US', unit: Length().inch, factor: 64.0 * 231.0);
  late final oilBarrel = _systemOfUnits.definePowersUnit(
      symbol: 'oil barrel', name: 'oil barrel', unit: Length().inch, factor: 42.0 * 231.0);

  // Imperial
  late final gallonUK = _systemOfUnits.definePowersUnit(
      symbol: 'gal UK', name: 'gallon UK', unit: Length().decimeter, factor: 4.54609);
  late final fluidOunceUK = _systemOfUnits.definePowersUnit(
      symbol: 'fl oz UK', name: 'fluid ounce', unit: Length().decimeter, factor: 4.54609 / 160.0);
  late final gillUK = _systemOfUnits.definePowersUnit(
      symbol: 'gi UK', name: 'gill UK', unit: Length().decimeter, factor: 4.54609 / 32.0);
  late final pintUK = _systemOfUnits.definePowersUnit(
      symbol: 'pt UK', name: 'pint UK', unit: Length().decimeter, factor: 4.54609 / 8.0);
  late final quartUK = _systemOfUnits.definePowersUnit(
      symbol: 'qt UK', name: 'quart UK', unit: Length().decimeter, factor: 4.54609 / 4.0);
  late final peckUK = _systemOfUnits.definePowersUnit(
      symbol: 'peck UK', name: 'peck UK', unit: Length().decimeter, factor: 2.0 * 4.54609);
  late final bushelUK = _systemOfUnits.definePowersUnit(
      symbol: 'bu UK', name: 'bushel UK', unit: Length().decimeter, factor: 8.0 * 4.54609);
  late final quarterUK = _systemOfUnits.definePowersUnit(
      symbol: 'qr UK', name: 'quarter UK', unit: Length().decimeter, factor: 64.0 * 4.54609);

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
    _systemOfUnits = PowersSystemOfUnits<Volume, Length>(this, power: 3);
    systemsOfUnits.addAll([_systemOfUnits]);
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
