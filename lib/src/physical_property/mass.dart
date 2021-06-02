import '../measurement/measurement.dart';
import '../measurement/systems_of_units.dart';
import '../quantity/quantity.dart';

/// Mass physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Mass] [Unit] instances.
class Mass extends PhysicalProperty {
  factory Mass() => _instance ??= Mass._internal('mass');

  Mass._internal(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(symbol: 'kg', name: 'kilogram', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'mg', name: 'milligram', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'g', name: 'gram', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 't', name: 'ton', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(symbol: 'lb', name: 'pound', factor: 0.45359237);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'oz', name: 'ounce', factor: 1.0 / 16.0);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'st', name: 'stone', factor: 14.0);
    _imperialSystemOfUnits.defineUnitWithFactor(symbol: 'qr', name: 'quarter', factor: 28.0);

    systemsOfMeasurent.addAll([_internationalSystemOfUnits, _imperialSystemOfUnits]);
  }

  static Mass? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;
  late ImperialSystemOfUnits _imperialSystemOfUnits;

  static Quantity grams({required double amount}) => Quantity(unit: g, amount: amount);
  static Quantity kilograms({required double amount}) => Quantity(unit: kg, amount: amount);
  static Quantity milligrams({required double amount}) => Quantity(unit: mg, amount: amount);
  static Quantity ounces({required double amount}) => Quantity(unit: oz, amount: amount);
  static Quantity pounds({required double amount}) => Quantity(unit: lb, amount: amount);
  static Quantity tons({required double amount}) => Quantity(unit: t, amount: amount);

  static Unit get g => Mass().gUnit;
  static Unit get kg => Mass().kgUnit;
  static Unit get mg => Mass().mgUnit;
  static Unit get t => Mass().tUnit;
  static Unit get oz => Mass().ozUnit;
  static Unit get lb => Mass().lbUnit;
  static Unit get st => Mass().stUnit;
  static Unit get qr => Mass().qrUnit;

  Unit get gUnit => _internationalSystemOfUnits.unitWith(symbol: 'g')!;
  Unit get kgUnit => _internationalSystemOfUnits.unitWith(symbol: 'kg')!;
  Unit get mgUnit => _internationalSystemOfUnits.unitWith(symbol: 'mg')!;
  Unit get tUnit => _internationalSystemOfUnits.unitWith(symbol: 't')!;
  Unit get ozUnit => _imperialSystemOfUnits.unitWith(symbol: 'oz')!;
  Unit get lbUnit => _imperialSystemOfUnits.unitWith(symbol: 'lb')!;
  Unit get stUnit => _imperialSystemOfUnits.unitWith(symbol: 'st')!;
  Unit get qrUnit => _imperialSystemOfUnits.unitWith(symbol: 'qr')!;
}
