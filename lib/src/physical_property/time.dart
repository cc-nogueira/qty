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

  late final InternationalSystemOfUnits<Time> siUnits;

  late final second = siUnits.defineBaseUnit(symbol: 's', name: 'second', factor: 1.0);
  late final decisecond = siUnits.defineUnit(symbol: 'ds', name: 'decisecond', factor: 1e-1);
  late final centisecond = siUnits.defineUnit(symbol: 'cs', name: 'centisecond', factor: 1e-2);
  late final millisecond = siUnits.defineUnit(symbol: 'ms', name: 'millisecond', factor: 1e-3);
  late final microsecond = siUnits.defineUnit(symbol: 'μs', name: 'microsecond', factor: 1e-6);
  late final nanosecond = siUnits.defineUnit(symbol: 'ns', name: 'nanosecond', factor: 1e-9);

  late final minute = siUnits.defineUnit(symbol: 'min', name: 'minute', factor: 60.0);
  late final hour = siUnits.defineUnit(symbol: 'h', name: 'hour', factor: 3600.0);
  late final day = siUnits.defineUnit(symbol: 'd', name: 'day', factor: 86400.0);
  late final week = siUnits.defineUnit(symbol: 'w', name: 'week', factor: 604800.0);

  // 365.2425 days
  late final year = siUnits.defineUnit(symbol: 'y', name: 'year', factor: 31556952.0);

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
  void defineSystemsOfUnits() {
    siUnits = InternationalSystemOfUnits<Time>(kind: this, unitConverter: UnitConverter<Time>());
    second;

    systemsOfUnits.addAll([siUnits]);
  }

  @override
  void loadAllUnits() {
    decisecond;
    centisecond;
    millisecond;
    microsecond;
    nanosecond;

    minute;
    hour;
    day;
    week;
    year;
  }
}
