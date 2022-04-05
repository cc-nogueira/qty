import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../measurement/unit_converter.dart';
import '../quantity/quantity.dart';

/// Time physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Time] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Time extends LinearConvertiblePhysicalProperty {
  factory Time() => _instance ??= Time._('time');

  Time._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(
        kind: this, unitConverter: LinearUnitConverter());
    _internationalSystemOfUnits.defineBaseUnit(
        symbol: 's', name: 'second', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'ns', name: 'nanosecond', factor: 0.000000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'us', name: 'microsecond', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'ms', name: 'millisecond', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'min', name: 'minute', factor: 60.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'hr', name: 'hour', factor: 3600.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'h', name: 'hour', factor: 3600.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'd', name: 'day', factor: 86400.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'w', name: 'week', factor: 604800.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'y', name: 'Julian year', factor: 31557600.0);

    systemsOfMeasurent.addAll([_internationalSystemOfUnits]);
  }

  static Time? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;

  static Quantity seconds({required double amount}) =>
      Quantity(unit: s, amount: amount);
  static Quantity nanoseconds({required double amount}) =>
      Quantity(unit: ns, amount: amount);
  static Quantity microseconds({required double amount}) =>
      Quantity(unit: us, amount: amount);
  static Quantity milliseconds({required double amount}) =>
      Quantity(unit: ms, amount: amount);
  static Quantity minutes({required double amount}) =>
      Quantity(unit: min, amount: amount);
  static Quantity hours({required double amount}) =>
      Quantity(unit: h, amount: amount);
  static Quantity days({required double amount}) =>
      Quantity(unit: d, amount: amount);
  static Quantity weeks({required double amount}) =>
      Quantity(unit: w, amount: amount);

  static LinearConvertibleUnit get s => Time().sUnit;
  static LinearConvertibleUnit get ns => Time().nsUnit;
  static LinearConvertibleUnit get us => Time().usUnit;
  static LinearConvertibleUnit get ms => Time().msUnit;
  static LinearConvertibleUnit get min => Time().minUnit;
  static LinearConvertibleUnit get hr => Time().hrUnit;
  static LinearConvertibleUnit get h => Time().hUnit;
  static LinearConvertibleUnit get d => Time().dUnit;
  static LinearConvertibleUnit get w => Time().wUnit;
  static LinearConvertibleUnit get y => Time().yUnit;

  LinearConvertibleUnit get sUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 's')!;
  LinearConvertibleUnit get nsUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'ns')!;
  LinearConvertibleUnit get usUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'us')!;
  LinearConvertibleUnit get msUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'ms')!;
  LinearConvertibleUnit get minUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'min')!;
  LinearConvertibleUnit get hrUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'hr')!;
  LinearConvertibleUnit get hUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'h')!;
  LinearConvertibleUnit get dUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'd')!;
  LinearConvertibleUnit get wUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'w')!;
  LinearConvertibleUnit get yUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'y')!;
}
