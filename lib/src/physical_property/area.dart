// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../quantity/quantity.dart';
import 'length.dart';

class Area extends MultipliedPhysicalProperties<Area, Length, Length> {
  factory Area() => _instance ??= Area._();

  Area._() : super(Length(), Length(), kind: 'area', dimensionSymbol: 'L²', quantitySymbol: 'a');

  static Area? _instance;

  late final CompoundSystemOfUnits<Area, Length, Length> _systemOfUnits;

  // SI
  late final squareMeter = _systemOfUnits.defineCompoundUnit(symbol: 'm²', name: 'square meter');
  late final squareDecimeter =
      _systemOfUnits.defineCompoundUnit(symbol: 'dm²', name: 'square decimeter');
  late final squareCentimeter =
      _systemOfUnits.defineCompoundUnit(symbol: 'cm²', name: 'square cintimeter');
  late final squareMillimeter =
      _systemOfUnits.defineCompoundUnit(symbol: 'mm²', name: 'square millimeter');
  late final squareMicrometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'μm²', name: 'square micrometer');
  late final squareNanometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'nm²', name: 'square nanometer');
  late final squarePicometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'pm²', name: 'square picometer');
  late final squareFemtometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'fm²', name: 'square femtometer');
  late final squareAttometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'am²', name: 'square attometer');
  late final squareZeptometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'zm²', name: 'square zeptometer');
  late final squareYoctometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'ym²', name: 'square yoctometer');

  late final squareDecameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'dam²', name: 'square decameter');
  late final squareHectometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'hm²', name: 'square hectometer');
  late final squareKilometer =
      _systemOfUnits.defineCompoundUnit(symbol: 'km²', name: 'square kilometer');
  late final squareMegameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Mm²', name: 'square megameter');
  late final squareGigameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Gm²', name: 'square gigameter');
  late final squareTerameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Tm²', name: 'square terameter');
  late final squarePetameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Pm²', name: 'square petameter');
  late final squareExameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Em²', name: 'square exameter');
  late final squareZettameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Zm²', name: 'square zetameter');
  late final squareYottameter =
      _systemOfUnits.defineCompoundUnit(symbol: 'Ym²', name: 'square yottameter');

  late final hectare =
      _systemOfUnits.defineCompoundUnit(symbol: 'ha', name: 'hectare', units: 'hm²');

  late final megabarn = _systemOfUnits.defineCompoundUnit(
      symbol: 'Mb', name: 'megabarn', units: 'pm²', factor: 100.0);
  late final kilobarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'kb', name: 'kilobarn', units: 'pm²', factor: 0.1);
  late final barn =
      _systemOfUnits.defineCompoundUnit(symbol: 'b', name: 'barn', units: 'fm²', factor: 100.0);
  late final millibarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'mb', name: 'millibarn', units: 'fm²', factor: 0.1);
  late final microbarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'μb', name: 'microbarn', units: 'am²', factor: 100);
  late final nanobarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'nb', name: 'nanobarn', units: 'am²', factor: 0.1);
  late final picobarn = _systemOfUnits.defineCompoundUnit(
      symbol: 'pb', name: 'picobarn', units: 'zm²', factor: 100.0);
  late final femtobarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'fb', name: 'femtobarn', units: 'zm²', factor: 0.1);
  late final attobarn = _systemOfUnits.defineCompoundUnit(
      symbol: 'ab', name: 'attobarn', units: 'ym²', factor: 100.0);
  late final zeptobarn =
      _systemOfUnits.defineCompoundUnit(symbol: 'zb', name: 'zeptobarn', units: 'ym²', factor: 0.1);

  // Imperial/US
  late final squareYard = _systemOfUnits.defineCompoundUnit(symbol: 'yd²', name: 'square yard');
  late final squareFoot = _systemOfUnits.defineCompoundUnit(symbol: 'ft²', name: 'square foot');
  late final squareInch = _systemOfUnits.defineCompoundUnit(symbol: 'in²', name: 'square inch');
  late final squareMile = _systemOfUnits.defineCompoundUnit(symbol: 'mi²', name: 'square mile');

  late final acre =
      _systemOfUnits.defineCompoundUnit(symbol: 'ac', name: 'acre', factor: 10.0, units: 'chain²');

  // Nautical
  late final squareNauticalMile =
      _systemOfUnits.defineCompoundUnit(symbol: 'NM²', name: 'square nautical mile');

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
    _systemOfUnits = CompoundSystemOfUnits<Area, Length, Length>(this);
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
