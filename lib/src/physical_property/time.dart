import '../measurement/measurement.dart';
import '../measurement/unit_converters.dart';
import '../measurement/systems_of_units.dart';
import '../quantity/quantity.dart';

/// Time physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Time] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Time extends PhysicalProperty {
  factory Time() => _instance ??= Time._internal('time');

  Time._internal(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits(kind: this, unitConverter: LinearUnitConverter());
    _internationalSystemOfUnits.defineBaseUnit(symbol: 's', name: 'second', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'ns', name: 'nanosecond', factor: 0.000000001);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'us', name: 'microsecond', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'ms', name: 'millisecond', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'min', name: 'minute', factor: 60.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'hr', name: 'hour', factor: 3600.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'd', name: 'day', factor: 86400.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'w', name: 'week', factor: 604800.0);
    _internationalSystemOfUnits.defineUnitWithFactor(symbol: 'y', name: 'Julian year', factor: 31557600.0);

    systemsOfMeasurent.addAll([_internationalSystemOfUnits]);
  }

  static Time? _instance;
  late InternationalSystemOfUnits _internationalSystemOfUnits;

  static Quantity seconds({required double amount}) => Quantity(unit: s, amount: amount);
  static Quantity nanoseconds({required double amount}) => Quantity(unit: ns, amount: amount);
  static Quantity microseconds({required double amount}) => Quantity(unit: us, amount: amount);
  static Quantity milliseconds({required double amount}) => Quantity(unit: ms, amount: amount);
  static Quantity minutes({required double amount}) => Quantity(unit: min, amount: amount);
  static Quantity hours({required double amount}) => Quantity(unit: hr, amount: amount);
  static Quantity days({required double amount}) => Quantity(unit: d, amount: amount);
  static Quantity weeks({required double amount}) => Quantity(unit: w, amount: amount);

  static Unit get s => Time().sUnit;
  static Unit get ns => Time().nsUnit;
  static Unit get us => Time().usUnit;
  static Unit get ms => Time().msUnit;
  static Unit get min => Time().minUnit;
  static Unit get hr => Time().hrUnit;
  static Unit get d => Time().dUnit;
  static Unit get w => Time().wUnit;
  static Unit get y => Time().yUnit;

  Unit get sUnit => _internationalSystemOfUnits.unitWith(symbol: 's')!;
  Unit get nsUnit => _internationalSystemOfUnits.unitWith(symbol: 'ns')!;
  Unit get usUnit => _internationalSystemOfUnits.unitWith(symbol: 'us')!;
  Unit get msUnit => _internationalSystemOfUnits.unitWith(symbol: 'ms')!;
  Unit get minUnit => _internationalSystemOfUnits.unitWith(symbol: 'min')!;
  Unit get hrUnit => _internationalSystemOfUnits.unitWith(symbol: 'hr')!;
  Unit get dUnit => _internationalSystemOfUnits.unitWith(symbol: 'd')!;
  Unit get wUnit => _internationalSystemOfUnits.unitWith(symbol: 'w')!;
  Unit get yUnit => _internationalSystemOfUnits.unitWith(symbol: 'y')!;
}
