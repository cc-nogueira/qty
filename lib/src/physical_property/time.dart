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
class Time extends PhysicalProperty<Time> {
  factory Time() => _instance ??= Time._('time');

  Time._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits =
        InternationalSystemOfUnits<Time>(kind: this, unitConverter: UnitConverter<Time>());
    _internationalSystemOfUnits.defineBaseUnit(symbol: 's', name: 'second', factor: 1.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'ns', name: 'nanosecond', factor: 0.000000001);
    _internationalSystemOfUnits.defineUnit(symbol: 'us', name: 'microsecond', factor: 0.000001);
    _internationalSystemOfUnits.defineUnit(symbol: 'ms', name: 'millisecond', factor: 0.001);
    _internationalSystemOfUnits.defineUnit(symbol: 'min', name: 'minute', factor: 60.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'hr', name: 'hour', factor: 3600.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'h', name: 'hour', factor: 3600.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'd', name: 'day', factor: 86400.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'w', name: 'week', factor: 604800.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'y', name: 'Julian year', factor: 31557600.0);

    systemsOfUnits.addAll([_internationalSystemOfUnits]);
  }

  static Time? _instance;
  late InternationalSystemOfUnits<Time> _internationalSystemOfUnits;

  static Quantity<Time> seconds({required double amount}) => Quantity(unit: s, amount: amount);
  static Quantity<Time> nanoseconds({required double amount}) => Quantity(unit: ns, amount: amount);
  static Quantity<Time> microseconds({required double amount}) =>
      Quantity(unit: us, amount: amount);
  static Quantity<Time> milliseconds({required double amount}) =>
      Quantity(unit: ms, amount: amount);
  static Quantity<Time> minutes({required double amount}) => Quantity(unit: min, amount: amount);
  static Quantity<Time> hours({required double amount}) => Quantity(unit: h, amount: amount);
  static Quantity<Time> days({required double amount}) => Quantity(unit: d, amount: amount);
  static Quantity<Time> weeks({required double amount}) => Quantity(unit: w, amount: amount);

  static Unit<Time> get s => Time().sUnit;
  static Unit<Time> get ns => Time().nsUnit;
  static Unit<Time> get us => Time().usUnit;
  static Unit<Time> get ms => Time().msUnit;
  static Unit<Time> get min => Time().minUnit;
  static Unit<Time> get hr => Time().hrUnit;
  static Unit<Time> get h => Time().hUnit;
  static Unit<Time> get d => Time().dUnit;
  static Unit<Time> get w => Time().wUnit;
  static Unit<Time> get y => Time().yUnit;

  Unit<Time> get sUnit => _internationalSystemOfUnits.unitWith(symbol: 's')!;
  Unit<Time> get nsUnit => _internationalSystemOfUnits.unitWith(symbol: 'ns')!;
  Unit<Time> get usUnit => _internationalSystemOfUnits.unitWith(symbol: 'us')!;
  Unit<Time> get msUnit => _internationalSystemOfUnits.unitWith(symbol: 'ms')!;
  Unit<Time> get minUnit => _internationalSystemOfUnits.unitWith(symbol: 'min')!;
  Unit<Time> get hrUnit => _internationalSystemOfUnits.unitWith(symbol: 'hr')!;
  Unit<Time> get hUnit => _internationalSystemOfUnits.unitWith(symbol: 'h')!;
  Unit<Time> get dUnit => _internationalSystemOfUnits.unitWith(symbol: 'd')!;
  Unit<Time> get wUnit => _internationalSystemOfUnits.unitWith(symbol: 'w')!;
  Unit<Time> get yUnit => _internationalSystemOfUnits.unitWith(symbol: 'y')!;
}
