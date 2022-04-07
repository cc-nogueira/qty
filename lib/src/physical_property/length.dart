import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Length physical property singleton.
///
/// Configures Internation (SI), Imperial (British) and Nautical systems of units defining their [Length] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Length extends LinearConvertiblePhysicalProperty<Length> {
  factory Length() => _instance ??= Length._('length');

  Length._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits<Length>(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(symbol: 'm', name: 'meter', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'pm', name: 'picometer', factor: 0.000000000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'micro', name: 'micrometer', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'mm', name: 'millimeter', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'cm', name: 'centimeter', factor: 0.01);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'dm', name: 'decimeter', factor: 0.1);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'km', name: 'kilometer', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits<Length>(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(symbol: 'ft', name: 'foot', factor: 0.3048);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'in', name: 'inch', factor: 1.0 / 12.0);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'yd', name: 'yard', factor: 3.0);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'mi', name: 'mile', factor: 5280.0);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'fa', name: 'fathom', factor: 6.0);

    _nauticalSystemOfUnits = NauticalSystemOfUnits<Length>(kind: this);
    _nauticalSystemOfUnits.defineBaseUnit(symbol: 'nm', name: 'nautical mile', factor: 1852.0);

    systemsOfMeasurement
        .addAll([_internationalSystemOfUnits, _imperialSystemOfUnits, _nauticalSystemOfUnits]);
  }

  static Length? _instance;
  late InternationalSystemOfUnits<Length> _internationalSystemOfUnits;
  late ImperialSystemOfUnits<Length> _imperialSystemOfUnits;
  late NauticalSystemOfUnits<Length> _nauticalSystemOfUnits;

  static Quantity<Length> millimeters({required double amount}) =>
      Quantity(unit: mm, amount: amount);
  static Quantity<Length> centimeters({required double amount}) =>
      Quantity(unit: cm, amount: amount);
  static Quantity<Length> decimeters({required double amount}) =>
      Quantity(unit: dm, amount: amount);
  static Quantity<Length> meters({required double amount}) => Quantity(unit: m, amount: amount);
  static Quantity<Length> kilometers({required double amount}) =>
      Quantity(unit: km, amount: amount);

  static Quantity<Length> feet({required double amount}) => Quantity(unit: ft, amount: amount);
  static Quantity<Length> inches({required double amount}) => Quantity(unit: inch, amount: amount);
  static Quantity<Length> yards({required double amount}) => Quantity(unit: yd, amount: amount);
  static Quantity<Length> miles({required double amount}) => Quantity(unit: mi, amount: amount);
  static Quantity<Length> fathoms({required double amount}) => Quantity(unit: fa, amount: amount);

  static LinearConvertibleUnit<Length> get mm => Length().mmUnit;
  static LinearConvertibleUnit<Length> get cm => Length().cmUnit;
  static LinearConvertibleUnit<Length> get dm => Length().dmUnit;
  static LinearConvertibleUnit<Length> get m => Length().mUnit;
  static LinearConvertibleUnit<Length> get km => Length().kmUnit;
  static LinearConvertibleUnit<Length> get ft => Length().ftUnit;
  static LinearConvertibleUnit<Length> get inch => Length().inUnit;
  static LinearConvertibleUnit<Length> get yd => Length().ydUnit;
  static LinearConvertibleUnit<Length> get mi => Length().miUnit;
  static LinearConvertibleUnit<Length> get fa => Length().faUnit;
  static LinearConvertibleUnit<Length> get nm => Length().nmUnit;

  LinearConvertibleUnit<Length> get mmUnit => _internationalSystemOfUnits.unitWith(symbol: 'mm')!;
  LinearConvertibleUnit<Length> get cmUnit => _internationalSystemOfUnits.unitWith(symbol: 'cm')!;
  LinearConvertibleUnit<Length> get dmUnit => _internationalSystemOfUnits.unitWith(symbol: 'dm')!;
  LinearConvertibleUnit<Length> get mUnit => _internationalSystemOfUnits.unitWith(symbol: 'm')!;
  LinearConvertibleUnit<Length> get kmUnit => _internationalSystemOfUnits.unitWith(symbol: 'km')!;
  LinearConvertibleUnit<Length> get ftUnit => _imperialSystemOfUnits.unitWith(symbol: 'ft')!;
  LinearConvertibleUnit<Length> get inUnit => _imperialSystemOfUnits.unitWith(symbol: 'in')!;
  LinearConvertibleUnit<Length> get ydUnit => _imperialSystemOfUnits.unitWith(symbol: 'yd')!;
  LinearConvertibleUnit<Length> get miUnit => _imperialSystemOfUnits.unitWith(symbol: 'mi')!;
  LinearConvertibleUnit<Length> get faUnit => _imperialSystemOfUnits.unitWith(symbol: 'fa')!;
  LinearConvertibleUnit<Length> get nmUnit => _nauticalSystemOfUnits.unitWith(symbol: 'nm')!;
}
