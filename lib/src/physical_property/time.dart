import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../measurement/unit_converter.dart';
import '../quantity/quantity.dart';

/// Time physical property.
///
/// Configures Internation (SI) systems of units defining their [Time] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class Time extends PhysicalProperty<Time> {
  factory Time() => _instance ??= Time._();
  Time._() : super(kind: 'time', dimensionSymbol: 'T', quantitySymbol: 't');

  static Time? _instance;
  late final Unit<Time> second;
  late final Unit<Time> decisecond;
  late final Unit<Time> centisecond;
  late final Unit<Time> millisecond;
  late final Unit<Time> microsecond;
  late final Unit<Time> nanosecond;

  late final Unit<Time> minute;
  late final Unit<Time> hour;
  late final Unit<Time> day;
  late final Unit<Time> week;
  late final Unit<Time> year;

  static Quantity<Time> seconds(double amount) => Quantity(unit: Time().second, amount: amount);
  static Quantity<Time> deciseconds(double amount) =>
      Quantity(unit: Time().decisecond, amount: amount);
  static Quantity<Time> centiseconds(double amount) =>
      Quantity(unit: Time().centisecond, amount: amount);
  static Quantity<Time> milliseconds(double amount) =>
      Quantity(unit: Time().millisecond, amount: amount);
  static Quantity<Time> microseconds(double amount) =>
      Quantity(unit: Time().microsecond, amount: amount);
  static Quantity<Time> nanoseconds(double amount) =>
      Quantity(unit: Time().nanosecond, amount: amount);

  static Quantity<Time> minutes(double amount) => Quantity(unit: Time().minute, amount: amount);
  static Quantity<Time> hours(double amount) => Quantity(unit: Time().hour, amount: amount);
  static Quantity<Time> days(double amount) => Quantity(unit: Time().day, amount: amount);
  static Quantity<Time> weeks(double amount) => Quantity(unit: Time().week, amount: amount);
  static Quantity<Time> years(double amount) => Quantity(unit: Time().year, amount: amount);

  @override
  void defineUnits() {
    final si = InternationalSystemOfUnits<Time>(kind: this, unitConverter: UnitConverter<Time>());
    second = si.defineBaseUnit(symbol: 's', name: 'second', factor: 1.0);
    decisecond = si.defineUnit(symbol: 'ds', name: 'decisecond', factor: 1e-1);
    centisecond = si.defineUnit(symbol: 'cs', name: 'centisecond', factor: 1e-2);
    millisecond = si.defineUnit(symbol: 'ms', name: 'millisecond', factor: 1e-3);
    microsecond = si.defineUnit(symbol: 'μs', name: 'microsecond', factor: 1e-6);
    nanosecond = si.defineUnit(symbol: 'ns', name: 'nanosecond', factor: 1e-9);

    minute = si.defineUnit(symbol: 'min', name: 'minute', factor: 60.0);
    hour = si.defineUnit(symbol: 'h', name: 'hour', factor: 3600.0);
    day = si.defineUnit(symbol: 'd', name: 'day', factor: 86400.0);
    week = si.defineUnit(symbol: 'w', name: 'week', factor: 604800.0);
    year = si.defineUnit(symbol: 'y', name: 'year', factor: 31556952.0); // 365.2425 days

    systemsOfUnits.addAll([si]);
  }
}
