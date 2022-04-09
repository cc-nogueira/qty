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
  Length._() : super(kind: 'length');

  static Length? _instance;

  // SI
  late final Unit<Length> meter;

  late final Unit<Length> decimeter;
  late final Unit<Length> centimeter;
  late final Unit<Length> millimeter;
  late final Unit<Length> micrometer;
  late final Unit<Length> nanometer;
  late final Unit<Length> picometer;
  late final Unit<Length> femtometer;
  late final Unit<Length> attometer;
  late final Unit<Length> zeptometer;
  late final Unit<Length> yoctometer;

  late final Unit<Length> decameter;
  late final Unit<Length> hectometer;
  late final Unit<Length> kilometer;
  late final Unit<Length> megameter;
  late final Unit<Length> gigameter;
  late final Unit<Length> terameter;
  late final Unit<Length> petameter;
  late final Unit<Length> exameter;
  late final Unit<Length> zettameter;
  late final Unit<Length> yottameter;

  // Non-SI
  late final Unit<Length> fermi;
  late final Unit<Length> angstrom;
  late final Unit<Length> micron;

  // Imperial/US
  late final Unit<Length> yard;
  late final Unit<Length> foot;
  late final Unit<Length> hand;
  late final Unit<Length> inch;
  late final Unit<Length> mil;
  late final Unit<Length> mile;

  // Nautical
  late final Unit<Length> nauticalMile;
  late final Unit<Length> cable;

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
  static Quantity<Length> miles(double amount) => Quantity(unit: Length().mile, amount: amount);

  // Nautical International
  static Quantity<Length> nauticalMiles(double amount) =>
      Quantity(unit: Length().nauticalMile, amount: amount);
  static Quantity<Length> cables(double amount) => Quantity(unit: Length().cable, amount: amount);

  @override
  void defineUnits() {
    // SI based:
    final si = InternationalSystemOfUnits<Length>(kind: this);
    meter = si.defineBaseUnit(symbol: 'm', name: 'meter', factor: 1.0);

    decimeter = si.defineUnit(symbol: 'dm', name: 'decimeter', factor: 1e-1);
    centimeter = si.defineUnit(symbol: 'cm', name: 'centimeter', factor: 1e-2);
    millimeter = si.defineUnit(symbol: 'mm', name: 'millimeter', factor: 1e-3);
    micrometer = si.defineUnit(symbol: 'μm', name: 'micrometer', factor: 1e-6);
    nanometer = si.defineUnit(symbol: 'nm', name: 'nanometer', factor: 1e-9);
    picometer = si.defineUnit(symbol: 'pm', name: 'picometer', factor: 1e-12);
    femtometer = si.defineUnit(symbol: 'fm', name: 'femtometer', factor: 1e-15);
    attometer = si.defineUnit(symbol: 'am', name: 'attometer', factor: 1e-18);
    zeptometer = si.defineUnit(symbol: 'zm', name: 'zeptometer', factor: 1e-21);
    yoctometer = si.defineUnit(symbol: 'ym', name: 'yoctometer', factor: 1e-24);

    decameter = si.defineUnit(symbol: 'dam', name: 'decameter', factor: 1e1);
    hectometer = si.defineUnit(symbol: 'hm', name: 'hectometer', factor: 1e2);
    kilometer = si.defineUnit(symbol: 'km', name: 'kilometer', factor: 1e3);
    megameter = si.defineUnit(symbol: 'Mm', name: 'megameter', factor: 1e6);
    gigameter = si.defineUnit(symbol: 'Gm', name: 'gigameter', factor: 1e9);
    terameter = si.defineUnit(symbol: 'Tm', name: 'terameter', factor: 1e12);
    petameter = si.defineUnit(symbol: 'Pm', name: 'petameter', factor: 1e15);
    exameter = si.defineUnit(symbol: 'Em', name: 'exameter', factor: 1e18);
    zettameter = si.defineUnit(symbol: 'Zm', name: 'zettameter', factor: 1e21);
    yottameter = si.defineUnit(symbol: 'Ym', name: 'yottameter', factor: 1e24);

    // SI correlated:
    fermi = si.defineUnit(symbol: 'fermi', name: 'fermi', factor: 1e-15);
    angstrom = si.defineUnit(symbol: 'Å', name: 'angstrom', factor: 1e-10);
    micron = si.defineUnit(symbol: 'micron', name: 'micron', factor: 1e-6);

    // Imperial/US
    final imperial = SystemOfUnits<Length>(kind: this, name: 'Imperial/US System of Units');
    yard = imperial.defineBaseUnit(symbol: 'yd', name: 'yard', factor: 0.9144);
    foot = imperial.defineUnit(symbol: 'ft', name: 'foot', factor: 1.0 / 3.0);
    hand = imperial.defineUnit(symbol: 'h', name: 'hand', factor: 1.0 / 9.0);
    inch = imperial.defineUnit(symbol: 'in', name: 'inch', factor: 1.0 / 36.0);
    mil = imperial.defineUnit(symbol: 'mil', name: 'mil', factor: 1.0 / 36e3);
    mile = imperial.defineUnit(symbol: 'mi', name: 'mile', factor: 1760.0);

    final nautical = SystemOfUnits<Length>(kind: this, name: 'Nautical System of Units');
    nauticalMile = nautical.defineBaseUnit(symbol: 'NM', name: 'nautical mile', factor: 1852.0);
    cable = nautical.defineUnit(symbol: 'cb', name: 'cable', factor: 1e-1);

    systemsOfUnits.addAll([si, imperial, nautical]);
  }
}
