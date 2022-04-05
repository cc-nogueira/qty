import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Mass physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Mass] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Mass extends LinearConvertiblePhysicalProperty {
  factory Mass() => _instance ??= Mass._('mass');

  Mass._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(
        symbol: 'kg', name: 'kilogram', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'mg', name: 'milligram', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'g', name: 'gram', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 't', name: 'ton', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(
        symbol: 'lb', name: 'pound', factor: 0.45359237);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'oz', name: 'ounce', factor: 1.0 / 16.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'st', name: 'stone', factor: 14.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'qr', name: 'quarter', factor: 28.0);

    systemsOfMeasurent
        .addAll([_internationalSystemOfUnits, _imperialSystemOfUnits]);
  }

  static Mass? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;
  late ImperialSystemOfUnits _imperialSystemOfUnits;

  static Quantity milligrams({required double amount}) =>
      Quantity(unit: mg, amount: amount);
  static Quantity grams({required double amount}) =>
      Quantity(unit: g, amount: amount);
  static Quantity kilograms({required double amount}) =>
      Quantity(unit: kg, amount: amount);
  static Quantity tons({required double amount}) =>
      Quantity(unit: t, amount: amount);

  static Quantity ounces({required double amount}) =>
      Quantity(unit: oz, amount: amount);
  static Quantity pounds({required double amount}) =>
      Quantity(unit: lb, amount: amount);
  static Quantity stones({required double amount}) =>
      Quantity(unit: st, amount: amount);
  static Quantity quarters({required double amount}) =>
      Quantity(unit: qr, amount: amount);

  static LinearConvertibleUnit get g => Mass().gUnit;
  static LinearConvertibleUnit get kg => Mass().kgUnit;
  static LinearConvertibleUnit get mg => Mass().mgUnit;
  static LinearConvertibleUnit get t => Mass().tUnit;
  static LinearConvertibleUnit get oz => Mass().ozUnit;
  static LinearConvertibleUnit get lb => Mass().lbUnit;
  static LinearConvertibleUnit get st => Mass().stUnit;
  static LinearConvertibleUnit get qr => Mass().qrUnit;

  LinearConvertibleUnit get gUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'g')!;
  LinearConvertibleUnit get kgUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'kg')!;
  LinearConvertibleUnit get mgUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'mg')!;
  LinearConvertibleUnit get tUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 't')!;
  LinearConvertibleUnit get ozUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'oz')!;
  LinearConvertibleUnit get lbUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'lb')!;
  LinearConvertibleUnit get stUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'st')!;
  LinearConvertibleUnit get qrUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'qr')!;
}
