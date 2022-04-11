// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';

class Area extends MultipliedPhysicalProperties<Area, Length, Length> {
  factory Area() => _instance ??= Area._();

  Area._() : super(Length(), Length(), kind: 'area', dimensionSymbol: 'L²', quantitySymbol: 'a');

  static Area? _instance;

  // SI
  late final Unit<Area> squareMeter;
  late final Unit<Area> squareDecimeter;
  late final Unit<Area> squareCentimeter;
  late final Unit<Area> squareMillimeter;
  late final Unit<Area> squareMicrometer;
  late final Unit<Area> squareNanometer;
  late final Unit<Area> squarePicometer;
  late final Unit<Area> squareFemtometer;
  late final Unit<Area> squareAttometer;
  late final Unit<Area> squareZeptometer;
  late final Unit<Area> squareYoctometer;

  late final Unit<Area> squareDecameter;
  late final Unit<Area> squareHectometer;
  late final Unit<Area> squareKilometer;
  late final Unit<Area> squareMegameter;
  late final Unit<Area> squareGigameter;
  late final Unit<Area> squareTerameter;
  late final Unit<Area> squarePetameter;
  late final Unit<Area> squareExameter;
  late final Unit<Area> squareZettameter;
  late final Unit<Area> squareYottameter;

  late final Unit<Area> hectare;

  late final Unit<Area> megabarn;
  late final Unit<Area> kilobarn;
  late final Unit<Area> barn;
  late final Unit<Area> millibarn;
  late final Unit<Area> microbarn;
  late final Unit<Area> nanobarn;
  late final Unit<Area> picobarn;
  late final Unit<Area> femtobarn;
  late final Unit<Area> attobarn;
  late final Unit<Area> zeptobarn;

  // Imperial/US
  late final Unit<Area> squareYard;
  late final Unit<Area> squareFoot;
  late final Unit<Area> squareInch;
  late final Unit<Area> squareMile;

  late final Unit<Area> acre;

  // Nautical
  late final Unit<Area> squareNauticalMile;

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
  void defineUnits() {
    final derived = DerivedSystemOfUnits<Area, Length, Length>(this);
    squareMeter = derived.defineNamedUnit(symbol: 'm²', name: 'square meter');
    squareDecimeter = derived.defineNamedUnit(symbol: 'dm²', name: 'square decimeter');
    squareCentimeter = derived.defineNamedUnit(symbol: 'cm²', name: 'square cintimeter');
    squareMillimeter = derived.defineNamedUnit(symbol: 'mm²', name: 'square millimeter');
    squareMicrometer = derived.defineNamedUnit(symbol: 'μm²', name: 'square micrometer');
    squareNanometer = derived.defineNamedUnit(symbol: 'nm²', name: 'square nanometer');
    squarePicometer = derived.defineNamedUnit(symbol: 'pm²', name: 'square picometer');
    squareFemtometer = derived.defineNamedUnit(symbol: 'fm²', name: 'square femtometer');
    squareAttometer = derived.defineNamedUnit(symbol: 'am²', name: 'square attometer');
    squareZeptometer = derived.defineNamedUnit(symbol: 'zm²', name: 'square zeptometer');
    squareYoctometer = derived.defineNamedUnit(symbol: 'ym²', name: 'square yoctometer');

    squareDecameter = derived.defineNamedUnit(symbol: 'dam²', name: 'square decameter');
    squareHectometer = derived.defineNamedUnit(symbol: 'hm²', name: 'square hectometer');
    squareKilometer = derived.defineNamedUnit(symbol: 'km²', name: 'square kilometer');
    squareMegameter = derived.defineNamedUnit(symbol: 'Mm²', name: 'square megameter');
    squareGigameter = derived.defineNamedUnit(symbol: 'Gm²', name: 'square gigameter');
    squareTerameter = derived.defineNamedUnit(symbol: 'Tm²', name: 'square terameter');
    squarePetameter = derived.defineNamedUnit(symbol: 'Pm²', name: 'square petameter');
    squareExameter = derived.defineNamedUnit(symbol: 'Em²', name: 'square exameter');
    squareZettameter = derived.defineNamedUnit(symbol: 'Zm²', name: 'square zetameter');
    squareYottameter = derived.defineNamedUnit(symbol: 'Ym²', name: 'square yottameter');

    hectare = derived.defineNamedUnit(symbol: 'ha', name: 'hectare', units: 'hm²');

    megabarn = derived.defineNamedUnit(symbol: 'Mb', name: 'megabarn', units: 'pm²', factor: 100.0);
    kilobarn = derived.defineNamedUnit(symbol: 'kb', name: 'kilobarn', units: 'pm²', factor: 0.1);
    barn = derived.defineNamedUnit(symbol: 'b', name: 'barn', units: 'fm²', factor: 100.0);
    millibarn = derived.defineNamedUnit(symbol: 'mb', name: 'millibarn', units: 'fm²', factor: 0.1);
    microbarn = derived.defineNamedUnit(symbol: 'μb', name: 'microbarn', units: 'am²', factor: 100);
    nanobarn = derived.defineNamedUnit(symbol: 'nb', name: 'nanobarn', units: 'am²', factor: 0.1);
    picobarn = derived.defineNamedUnit(symbol: 'pb', name: 'picobarn', units: 'zm²', factor: 100.0);
    femtobarn = derived.defineNamedUnit(symbol: 'fb', name: 'femtobarn', units: 'zm²', factor: 0.1);
    attobarn = derived.defineNamedUnit(symbol: 'ab', name: 'attobarn', units: 'ym²', factor: 100.0);
    zeptobarn = derived.defineNamedUnit(symbol: 'zb', name: 'zeptobarn', units: 'ym²', factor: 0.1);

    squareYard = derived.defineNamedUnit(symbol: 'yd²', name: 'square yard');
    squareFoot = derived.defineNamedUnit(symbol: 'ft²', name: 'square foot');
    squareInch = derived.defineNamedUnit(symbol: 'in²', name: 'square inch');
    squareMile = derived.defineNamedUnit(symbol: 'mi²', name: 'square mile');
    acre = derived.defineNamedUnit(symbol: 'ac', name: 'acre', factor: 10.0, units: 'chain²');

    squareNauticalMile = derived.defineNamedUnit(symbol: 'NM²', name: 'square nautical mile');

    systemsOfUnits.add(derived);
  }
}
