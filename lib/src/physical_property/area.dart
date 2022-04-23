// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../quantity/quantity.dart';
import 'length.dart';

class Area extends PowersPhysicalProperty<Area, Length> {
  factory Area() => _instance ??= Area._();

  Area._() : super(Length(), power: 2, kind: 'area', dimensionSymbol: 'L²', quantitySymbol: 'a');

  static Area? _instance;

  late final PowersSystemOfUnits<Area, Length> _systemOfUnits;

  // SI
  late final squareMeter =
      _systemOfUnits.definePowersUnit(symbol: 'm²', name: 'square meter', unit: Length().meter);
  late final squareDecimeter = _systemOfUnits.definePowersUnit(
      symbol: 'dm²', name: 'square decimeter', unit: Length().decimeter);
  late final squareCentimeter = _systemOfUnits.definePowersUnit(
      symbol: 'cm²', name: 'square centimeter', unit: Length().centimeter);
  late final squareMillimeter = _systemOfUnits.definePowersUnit(
      symbol: 'mm²', name: 'square millimeter', unit: Length().millimeter);
  late final squareMicrometer = _systemOfUnits.definePowersUnit(
      symbol: 'μm²', name: 'square micrometer', unit: Length().micrometer);
  late final squareNanometer = _systemOfUnits.definePowersUnit(
      symbol: 'nm²', name: 'square nanometer', unit: Length().nanometer);
  late final squarePicometer = _systemOfUnits.definePowersUnit(
      symbol: 'pm²', name: 'square picometer', unit: Length().picometer);
  late final squareFemtometer = _systemOfUnits.definePowersUnit(
      symbol: 'fm²', name: 'square femtometer', unit: Length().femtometer);
  late final squareAttometer = _systemOfUnits.definePowersUnit(
      symbol: 'am²', name: 'square attometer', unit: Length().attometer);
  late final squareZeptometer = _systemOfUnits.definePowersUnit(
      symbol: 'zm²', name: 'square zeptometer', unit: Length().zeptometer);
  late final squareYoctometer = _systemOfUnits.definePowersUnit(
      symbol: 'ym²', name: 'square yoctometer', unit: Length().yoctometer);

  late final squareDecameter = _systemOfUnits.definePowersUnit(
      symbol: 'dam²', name: 'square decameter', unit: Length().decameter);
  late final squareHectometer = _systemOfUnits.definePowersUnit(
      symbol: 'hm²', name: 'square hectometer', unit: Length().hectometer);
  late final squareKilometer = _systemOfUnits.definePowersUnit(
      symbol: 'km²', name: 'square kilometer', unit: Length().kilometer);
  late final squareMegameter = _systemOfUnits.definePowersUnit(
      symbol: 'Mm²', name: 'square megameter', unit: Length().megameter);
  late final squareGigameter = _systemOfUnits.definePowersUnit(
      symbol: 'Gm²', name: 'square gigameter', unit: Length().gigameter);
  late final squareTerameter = _systemOfUnits.definePowersUnit(
      symbol: 'Tm²', name: 'square terameter', unit: Length().terameter);
  late final squarePetameter = _systemOfUnits.definePowersUnit(
      symbol: 'Pm²', name: 'square petameter', unit: Length().petameter);
  late final squareExameter = _systemOfUnits.definePowersUnit(
      symbol: 'Em²', name: 'square exameter', unit: Length().exameter);
  late final squareZettameter = _systemOfUnits.definePowersUnit(
      symbol: 'Zm²', name: 'square zettameter', unit: Length().zettameter);
  late final squareYottameter = _systemOfUnits.definePowersUnit(
      symbol: 'Ym²', name: 'square yottameter', unit: Length().yottameter);

  late final hectare =
      _systemOfUnits.definePowersUnit(symbol: 'ha', name: 'hectare', unit: Length().hectometer);

  late final megabarn = _systemOfUnits.definePowersUnit(
      symbol: 'Mb', name: 'megabarn', unit: Length().picometer, factor: 100.0);
  late final kilobarn = _systemOfUnits.definePowersUnit(
      symbol: 'kb', name: 'kilobarn', unit: Length().picometer, factor: 0.1);
  late final barn = _systemOfUnits.definePowersUnit(
      symbol: 'b', name: 'barn', unit: Length().femtometer, factor: 100.0);
  late final millibarn = _systemOfUnits.definePowersUnit(
      symbol: 'mb', name: 'millibarn', unit: Length().femtometer, factor: 0.1);
  late final microbarn = _systemOfUnits.definePowersUnit(
      symbol: 'μb', name: 'microbarn', unit: Length().attometer, factor: 100);
  late final nanobarn = _systemOfUnits.definePowersUnit(
      symbol: 'nb', name: 'nanobarn', unit: Length().attometer, factor: 0.1);
  late final picobarn = _systemOfUnits.definePowersUnit(
      symbol: 'pb', name: 'picobarn', unit: Length().zeptometer, factor: 100.0);
  late final femtobarn = _systemOfUnits.definePowersUnit(
      symbol: 'fb', name: 'femtobarn', unit: Length().attometer, factor: 0.1);
  late final attobarn = _systemOfUnits.definePowersUnit(
      symbol: 'ab', name: 'attobarn', unit: Length().yoctometer, factor: 100.0);
  late final zeptobarn = _systemOfUnits.definePowersUnit(
      symbol: 'zb', name: 'zeptobarn', unit: Length().yoctometer, factor: 0.1);

  // Imperial/US
  late final squareYard =
      _systemOfUnits.definePowersUnit(symbol: 'yd²', name: 'square yard', unit: Length().yard);
  late final squareFoot =
      _systemOfUnits.definePowersUnit(symbol: 'ft²', name: 'square foot', unit: Length().foot);
  late final squareInch =
      _systemOfUnits.definePowersUnit(symbol: 'in²', name: 'square inch', unit: Length().inch);
  late final squareMile =
      _systemOfUnits.definePowersUnit(symbol: 'mi²', name: 'square mile', unit: Length().mile);

  late final acre = _systemOfUnits.definePowersUnit(
      symbol: 'ac', name: 'acre', factor: 10.0, unit: Length().chain);

  // Nautical
  late final squareNauticalMile = _systemOfUnits.definePowersUnit(
      symbol: 'NM²', name: 'square nautical mile', unit: Length().nauticalMile);

  // SI
  static Quantity<Area> squareMeters(double amount) =>
      Quantity(unit: Area().squareMeter, amount: amount);

  static Quantity<Area> squareDecimeters(double amount) =>
      Quantity(unit: Area().squareDecimeter, amount: amount);
  static Quantity<Area> squareCentimeters(double amount) =>
      Quantity(unit: Area().squareCentimeter, amount: amount);
  static Quantity<Area> squareMillimeters(double amount) =>
      Quantity(unit: Area().squareMillimeter, amount: amount);
  static Quantity<Area> squareMicrometers(double amount) =>
      Quantity(unit: Area().squareMicrometer, amount: amount);
  static Quantity<Area> squareNanometers(double amount) =>
      Quantity(unit: Area().squareNanometer, amount: amount);
  static Quantity<Area> squarePicometers(double amount) =>
      Quantity(unit: Area().squarePicometer, amount: amount);
  static Quantity<Area> squareFemtometers(double amount) =>
      Quantity(unit: Area().squareFemtometer, amount: amount);
  static Quantity<Area> squareAttometers(double amount) =>
      Quantity(unit: Area().squareAttometer, amount: amount);
  static Quantity<Area> squareZeptometers(double amount) =>
      Quantity(unit: Area().squareZeptometer, amount: amount);
  static Quantity<Area> squareYoctometers(double amount) =>
      Quantity(unit: Area().squareYoctometer, amount: amount);

  static Quantity<Area> squareDecameters(double amount) =>
      Quantity(unit: Area().squareDecameter, amount: amount);
  static Quantity<Area> squareHectometers(double amount) =>
      Quantity(unit: Area().squareHectometer, amount: amount);
  static Quantity<Area> squareKilometers(double amount) =>
      Quantity(unit: Area().squareKilometer, amount: amount);
  static Quantity<Area> squareMegameters(double amount) =>
      Quantity(unit: Area().squareMegameter, amount: amount);
  static Quantity<Area> squareGigameters(double amount) =>
      Quantity(unit: Area().squareGigameter, amount: amount);
  static Quantity<Area> squareTerameters(double amount) =>
      Quantity(unit: Area().squareTerameter, amount: amount);
  static Quantity<Area> squarePetameters(double amount) =>
      Quantity(unit: Area().squarePetameter, amount: amount);
  static Quantity<Area> squareExameters(double amount) =>
      Quantity(unit: Area().squareExameter, amount: amount);
  static Quantity<Area> squareZettameters(double amount) =>
      Quantity(unit: Area().squareZettameter, amount: amount);
  static Quantity<Area> squareYottameters(double amount) =>
      Quantity(unit: Area().squareYottameter, amount: amount);

  static Quantity<Area> hectares(double amount) => Quantity(unit: Area().hectare, amount: amount);

  static Quantity<Area> barns(double amount) => Quantity(unit: Area().barn, amount: amount);
  static Quantity<Area> millibarns(double amount) =>
      Quantity(unit: Area().millibarn, amount: amount);
  static Quantity<Area> microbarns(double amount) =>
      Quantity(unit: Area().microbarn, amount: amount);
  static Quantity<Area> nanobarns(double amount) => Quantity(unit: Area().nanobarn, amount: amount);
  static Quantity<Area> picobarns(double amount) => Quantity(unit: Area().picobarn, amount: amount);
  static Quantity<Area> femtobarns(double amount) =>
      Quantity(unit: Area().femtobarn, amount: amount);
  static Quantity<Area> attobarns(double amount) => Quantity(unit: Area().attobarn, amount: amount);
  static Quantity<Area> zeptobarns(double amount) =>
      Quantity(unit: Area().zeptobarn, amount: amount);

  static Quantity<Area> kilobarns(double amount) => Quantity(unit: Area().kilobarn, amount: amount);
  static Quantity<Area> megabarns(double amount) => Quantity(unit: Area().megabarn, amount: amount);

  // Imperial/US
  static Quantity<Area> squareYards(double amount) =>
      Quantity(unit: Area().squareYard, amount: amount);
  static Quantity<Area> squareFeet(double amount) =>
      Quantity(unit: Area().squareFoot, amount: amount);
  static Quantity<Area> squareInches(double amount) =>
      Quantity(unit: Area().squareInch, amount: amount);
  static Quantity<Area> squareMiles(double amount) =>
      Quantity(unit: Area().squareMile, amount: amount);

  static Quantity<Area> acres(double amount) => Quantity(unit: Area().acre, amount: amount);

  // Nautical
  static Quantity<Area> squareNauticalMiles(double amount) =>
      Quantity(unit: Area().squareNauticalMile, amount: amount);

  @override
  void defineSystemsOfUnits() {
    _systemOfUnits = PowersSystemOfUnits<Area, Length>(this, power: 2);
    systemsOfUnits.add(_systemOfUnits);
  }

  @override
  void loadAllUnits() {
    squareMeter;
    squareDecimeter;
    squareCentimeter;
    squareMillimeter;
    squareMicrometer;
    squareNanometer;
    squarePicometer;
    squareFemtometer;
    squareAttometer;
    squareZeptometer;
    squareYoctometer;

    squareDecameter;
    squareHectometer;
    squareKilometer;
    squareMegameter;
    squareGigameter;
    squareTerameter;
    squarePetameter;
    squareExameter;
    squareZettameter;
    squareYottameter;

    hectare;

    megabarn;
    kilobarn;
    barn;
    millibarn;
    microbarn;
    nanobarn;
    picobarn;
    femtobarn;
    attobarn;
    zeptobarn;

    squareYard;
    squareFoot;
    squareInch;
    squareMile;
    acre;

    squareNauticalMile;
  }
}
