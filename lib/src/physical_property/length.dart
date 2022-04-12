import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Length physical property singleton.
///
/// Configures Internation (SI), Imperial/US and Nautical systems of units defining their [Length] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class Length extends PhysicalProperty<Length> {
  factory Length() => _instance ??= Length._();
  Length._() : super(kind: 'length', dimensionSymbol: 'L', quantitySymbol: 'l');

  static Length? _instance;

  late final InternationalSystemOfUnits<Length> _siUnits;
  late final SystemOfUnits<Length> _imperialUsUnits;
  late final SystemOfUnits<Length> _nauticalUnits;

  // SI
  late final meter = _siUnits.defineBaseUnit(symbol: 'm', name: 'meter', factor: 1.0);

  late final decimeter = _siUnits.defineUnit(symbol: 'dm', name: 'decimeter', factor: 1e-1);
  late final centimeter = _siUnits.defineUnit(symbol: 'cm', name: 'centimeter', factor: 1e-2);
  late final millimeter = _siUnits.defineUnit(symbol: 'mm', name: 'millimeter', factor: 1e-3);
  late final micrometer = _siUnits.defineUnit(symbol: 'μm', name: 'micrometer', factor: 1e-6);
  late final nanometer = _siUnits.defineUnit(symbol: 'nm', name: 'nanometer', factor: 1e-9);
  late final picometer = _siUnits.defineUnit(symbol: 'pm', name: 'picometer', factor: 1e-12);
  late final femtometer = _siUnits.defineUnit(symbol: 'fm', name: 'femtometer', factor: 1e-15);
  late final attometer = _siUnits.defineUnit(symbol: 'am', name: 'attometer', factor: 1e-18);
  late final zeptometer = _siUnits.defineUnit(symbol: 'zm', name: 'zeptometer', factor: 1e-21);
  late final yoctometer = _siUnits.defineUnit(symbol: 'ym', name: 'yoctometer', factor: 1e-24);

  late final decameter = _siUnits.defineUnit(symbol: 'dam', name: 'decameter', factor: 1e1);
  late final hectometer = _siUnits.defineUnit(symbol: 'hm', name: 'hectometer', factor: 1e2);
  late final kilometer = _siUnits.defineUnit(symbol: 'km', name: 'kilometer', factor: 1e3);
  late final megameter = _siUnits.defineUnit(symbol: 'Mm', name: 'megameter', factor: 1e6);
  late final gigameter = _siUnits.defineUnit(symbol: 'Gm', name: 'gigameter', factor: 1e9);
  late final terameter = _siUnits.defineUnit(symbol: 'Tm', name: 'terameter', factor: 1e12);
  late final petameter = _siUnits.defineUnit(symbol: 'Pm', name: 'petameter', factor: 1e15);
  late final exameter = _siUnits.defineUnit(symbol: 'Em', name: 'exameter', factor: 1e18);
  late final zettameter = _siUnits.defineUnit(symbol: 'Zm', name: 'zettameter', factor: 1e21);
  late final yottameter = _siUnits.defineUnit(symbol: 'Ym', name: 'yottameter', factor: 1e24);

  // Non-SI
  late final fermi = _siUnits.defineUnit(symbol: 'fermi', name: 'fermi', factor: 1e-15);
  late final angstrom = _siUnits.defineUnit(symbol: 'Å', name: 'angstrom', factor: 1e-10);
  late final micron = _siUnits.defineUnit(symbol: 'micron', name: 'micron', factor: 1e-6);

  // Imperial/US
  late final yard = _imperialUsUnits.defineBaseUnit(symbol: 'yd', name: 'yard', factor: 0.9144);

  late final foot = _imperialUsUnits.defineUnit(symbol: 'ft', name: 'foot', factor: 1.0 / 3.0);
  late final hand = _imperialUsUnits.defineUnit(symbol: 'h', name: 'hand', factor: 1.0 / 9.0);
  late final inch = _imperialUsUnits.defineUnit(symbol: 'in', name: 'inch', factor: 1.0 / 36.0);
  late final mil = _imperialUsUnits.defineUnit(symbol: 'mil', name: 'mil', factor: 1.0 / 36e3);

  late final link = _imperialUsUnits.defineUnit(symbol: 'lnk', name: 'link', factor: 0.22);
  late final chain = _imperialUsUnits.defineUnit(symbol: 'chain', name: 'chain', factor: 22.0);
  late final furlong =
      _imperialUsUnits.defineUnit(symbol: 'furlong', name: 'furlong', factor: 220.0);
  late final mile = _imperialUsUnits.defineUnit(symbol: 'mi', name: 'mile', factor: 1760.0);

  // Nautical
  late final nauticalMile =
      _nauticalUnits.defineBaseUnit(symbol: 'NM', name: 'nautical mile', factor: 1852.0);
  late final cable = _nauticalUnits.defineUnit(symbol: 'cb', name: 'cable', factor: 1e-1);

  // SI
  static Quantity<Length> meters(double amount) => Quantity(unit: Length().meter, amount: amount);

  static Quantity<Length> decimeters(double amount) =>
      Quantity(unit: Length().decimeter, amount: amount);
  static Quantity<Length> centimeters(double amount) =>
      Quantity(unit: Length().centimeter, amount: amount);
  static Quantity<Length> millimeters(double amount) =>
      Quantity(unit: Length().millimeter, amount: amount);
  static Quantity<Length> micrometers(double amount) =>
      Quantity(unit: Length().micrometer, amount: amount);
  static Quantity<Length> nanometers(double amount) =>
      Quantity(unit: Length().nanometer, amount: amount);
  static Quantity<Length> picometers(double amount) =>
      Quantity(unit: Length().picometer, amount: amount);
  static Quantity<Length> femtometers(double amount) =>
      Quantity(unit: Length().femtometer, amount: amount);
  static Quantity<Length> attometers(double amount) =>
      Quantity(unit: Length().attometer, amount: amount);
  static Quantity<Length> zeptometers(double amount) =>
      Quantity(unit: Length().zeptometer, amount: amount);
  static Quantity<Length> yoctometers(double amount) =>
      Quantity(unit: Length().yoctometer, amount: amount);

  static Quantity<Length> decameters(double amount) =>
      Quantity(unit: Length().decameter, amount: amount);
  static Quantity<Length> hectometers(double amount) =>
      Quantity(unit: Length().hectometer, amount: amount);
  static Quantity<Length> kilometers(double amount) =>
      Quantity(unit: Length().kilometer, amount: amount);
  static Quantity<Length> megameters(double amount) =>
      Quantity(unit: Length().megameter, amount: amount);
  static Quantity<Length> gigameters(double amount) =>
      Quantity(unit: Length().gigameter, amount: amount);
  static Quantity<Length> terameters(double amount) =>
      Quantity(unit: Length().terameter, amount: amount);
  static Quantity<Length> petameters(double amount) =>
      Quantity(unit: Length().petameter, amount: amount);
  static Quantity<Length> exameters(double amount) =>
      Quantity(unit: Length().exameter, amount: amount);
  static Quantity<Length> zettameters(double amount) =>
      Quantity(unit: Length().zettameter, amount: amount);
  static Quantity<Length> yottameters(double amount) =>
      Quantity(unit: Length().yottameter, amount: amount);

  // Non-SI
  static Quantity<Length> fermis(double amount) => Quantity(unit: Length().fermi, amount: amount);
  static Quantity<Length> angstroms(double amount) =>
      Quantity(unit: Length().angstrom, amount: amount);
  static Quantity<Length> microns(double amount) => Quantity(unit: Length().micron, amount: amount);

  // Imperial/US
  static Quantity<Length> yards(double amount) => Quantity(unit: Length().yard, amount: amount);
  static Quantity<Length> feet(double amount) => Quantity(unit: Length().foot, amount: amount);
  static Quantity<Length> hands(double amount) => Quantity(unit: Length().hand, amount: amount);
  static Quantity<Length> inches(double amount) => Quantity(unit: Length().inch, amount: amount);
  static Quantity<Length> mils(double amount) => Quantity(unit: Length().mil, amount: amount);

  static Quantity<Length> chains(double amount) => Quantity(unit: Length().chain, amount: amount);
  static Quantity<Length> furlongs(double amount) =>
      Quantity(unit: Length().furlong, amount: amount);
  static Quantity<Length> miles(double amount) => Quantity(unit: Length().mile, amount: amount);

  // Nautical International
  static Quantity<Length> nauticalMiles(double amount) =>
      Quantity(unit: Length().nauticalMile, amount: amount);
  static Quantity<Length> cables(double amount) => Quantity(unit: Length().cable, amount: amount);

  @override
  void defineSystemsOfUnits() {
    // SI based:
    _siUnits = InternationalSystemOfUnits<Length>(kind: this);
    meter;

    _imperialUsUnits = SystemOfUnits<Length>(kind: this, name: 'Imperial/US System of Units');
    yard;

    _nauticalUnits = SystemOfUnits<Length>(kind: this, name: 'Nautical System of Units');
    nauticalMile;

    systemsOfUnits.addAll([_siUnits, _imperialUsUnits, _nauticalUnits]);
  }

  @override
  void loadAllUnits() {
    decimeter;
    centimeter;
    millimeter;
    micrometer;
    nanometer;
    picometer;
    femtometer;
    attometer;
    zeptometer;
    yoctometer;

    decameter;
    hectometer;
    kilometer;
    megameter;
    gigameter;
    terameter;
    petameter;
    exameter;
    zettameter;
    yottameter;

    // SI correlated:
    fermi;
    angstrom;
    micron;

    // Imperial/US
    foot;
    hand;
    inch;
    mil;
    link;
    chain;
    furlong;
    mile;

    cable;
  }
}
