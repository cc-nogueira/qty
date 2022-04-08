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
  factory Time() => _instance ??= Time._();
  Time._() : super(kind: 'time');

  static Time? _instance;
  late Unit<Time> second;
  late Unit<Time> nanosecond;
  late Unit<Time> microsecond;
  late Unit<Time> millisecond;
  late Unit<Time> minute;
  late Unit<Time> hour;
  late Unit<Time> day;
  late Unit<Time> week;
  late Unit<Time> year;

  static Quantity<Time> seconds(double amount) => Quantity(unit: Time().second, amount: amount);
  static Quantity<Time> nanoseconds(double amount) =>
      Quantity(unit: Time().nanosecond, amount: amount);
  static Quantity<Time> microseconds(double amount) =>
      Quantity(unit: Time().microsecond, amount: amount);
  static Quantity<Time> milliseconds(double amount) =>
      Quantity(unit: Time().millisecond, amount: amount);
  static Quantity<Time> minutes(double amount) => Quantity(unit: Time().minute, amount: amount);
  static Quantity<Time> hours(double amount) => Quantity(unit: Time().hour, amount: amount);
  static Quantity<Time> days(double amount) => Quantity(unit: Time().day, amount: amount);
  static Quantity<Time> weeks(double amount) => Quantity(unit: Time().week, amount: amount);

  @override
  void defineUnits() {
    final si = InternationalSystemOfUnits<Time>(kind: this, unitConverter: UnitConverter<Time>());
    second = si.defineBaseUnit(symbol: 's', name: 'second', factor: 1.0);
    nanosecond = si.defineUnit(symbol: 'ns', name: 'nanosecond', factor: 0.000000001);
    microsecond = si.defineUnit(symbol: 'us', name: 'microsecond', factor: 0.000001);
    millisecond = si.defineUnit(symbol: 'ms', name: 'millisecond', factor: 0.001);
    minute = si.defineUnit(symbol: 'min', name: 'minute', factor: 60.0);
    hour = si.defineUnit(symbol: 'h', name: 'hour', factor: 3600.0);
    day = si.defineUnit(symbol: 'd', name: 'day', factor: 86400.0);
    week = si.defineUnit(symbol: 'w', name: 'week', factor: 604800.0);
    year = si.defineUnit(symbol: 'y', name: 'year', factor: 31557600.0);

    systemsOfUnits.addAll([si]);
  }
}
