import '../measurement/measurement.dart';
import '../measurement/systems_of_units.dart';
import '../quantity/quantity.dart';

/// Length physical property singleton.
///
/// Configures Internation (SI), Imperial (British) and Nautical systems of units defining their [Length] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Length extends PhysicalProperty {
  factory Length() => _instance ??= Length._internal('length');

  Length._internal(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(
        symbol: 'm', name: 'meter', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'pm', name: 'picometer', factor: 0.000000000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'nm', name: 'nanomiter', factor: 0.000000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'micro', name: 'micrometer', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'mm', name: 'millimeter', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'cm', name: 'centimeter', factor: 0.01);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'dm', name: 'decimeter', factor: 0.1);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'km', name: 'kilometer', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(
        symbol: 'ft', name: 'foot', factor: 0.3048);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'in', name: 'inch', factor: 1.0 / 12.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'yd', name: 'yard', factor: 3.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'mi', name: 'mile', factor: 5280.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'fa', name: 'fathom', factor: 6.0);

    _nauticalSystemOfUnits = NauticalSystemOfUnits(kind: this);
    _nauticalSystemOfUnits.defineBaseUnit(
        symbol: 'nm', name: 'nautical mile', factor: 1852.0);

    systemsOfMeasurent.addAll([
      _internationalSystemOfUnits,
      _imperialSystemOfUnits,
      _nauticalSystemOfUnits
    ]);
  }

  static Length? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;
  late ImperialSystemOfUnits _imperialSystemOfUnits;
  late NauticalSystemOfUnits _nauticalSystemOfUnits;

  static Quantity millimeters({required double amount}) =>
      Quantity(unit: mm, amount: amount);
  static Quantity centimeters({required double amount}) =>
      Quantity(unit: cm, amount: amount);
  static Quantity decimeters({required double amount}) =>
      Quantity(unit: dm, amount: amount);
  static Quantity meters({required double amount}) =>
      Quantity(unit: m, amount: amount);
  static Quantity kilometers({required double amount}) =>
      Quantity(unit: km, amount: amount);

  static Quantity feet({required double amount}) =>
      Quantity(unit: ft, amount: amount);
  static Quantity inches({required double amount}) =>
      Quantity(unit: inch, amount: amount);
  static Quantity yards({required double amount}) =>
      Quantity(unit: yd, amount: amount);
  static Quantity miles({required double amount}) =>
      Quantity(unit: mi, amount: amount);
  static Quantity fathoms({required double amount}) =>
      Quantity(unit: fa, amount: amount);

  static Unit get mm => Length().mmUnit;
  static Unit get cm => Length().cmUnit;
  static Unit get dm => Length().dmUnit;
  static Unit get m => Length().mUnit;
  static Unit get km => Length().kmUnit;
  static Unit get ft => Length().ftUnit;
  static Unit get inch => Length().inUnit;
  static Unit get yd => Length().ydUnit;
  static Unit get mi => Length().miUnit;
  static Unit get fa => Length().faUnit;
  static Unit get nm => Length().nmUnit;

  Unit get mmUnit => _internationalSystemOfUnits.unitWith(symbol: 'mm')!;
  Unit get cmUnit => _internationalSystemOfUnits.unitWith(symbol: 'cm')!;
  Unit get dmUnit => _internationalSystemOfUnits.unitWith(symbol: 'dm')!;
  Unit get mUnit => _internationalSystemOfUnits.unitWith(symbol: 'm')!;
  Unit get kmUnit => _internationalSystemOfUnits.unitWith(symbol: 'km')!;
  Unit get ftUnit => _imperialSystemOfUnits.unitWith(symbol: 'ft')!;
  Unit get inUnit => _imperialSystemOfUnits.unitWith(symbol: 'in')!;
  Unit get ydUnit => _imperialSystemOfUnits.unitWith(symbol: 'yd')!;
  Unit get miUnit => _imperialSystemOfUnits.unitWith(symbol: 'mi')!;
  Unit get faUnit => _imperialSystemOfUnits.unitWith(symbol: 'fa')!;
  Unit get nmUnit => _nauticalSystemOfUnits.unitWith(symbol: 'nm')!;
}
