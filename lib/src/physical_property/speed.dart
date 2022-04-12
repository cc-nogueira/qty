// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Speed, Length, Time> {
  factory Speed() => _instance ??= Speed._();

  Speed._() : super(Length(), Time(), kind: 'speed', dimensionSymbol: 'v', quantitySymbol: 'v');

  static Speed? _instance;

  late final CompoundSystemOfUnits<Speed, Length, Time> _systemOfUnits;

  // SI
  late final meterPerSecond =
      _systemOfUnits.defineCompoundUnit(symbol: 'm/s', name: 'meters per second');
  late final centimeterPerSecond =
      _systemOfUnits.defineCompoundUnit(symbol: 'cm/s', name: 'cintimeters per second');
  late final kilometerPerHour =
      _systemOfUnits.defineCompoundUnit(symbol: 'km/h', name: 'kilometers per hour');

  // Imperial/US
  late final milePerHour =
      _systemOfUnits.defineCompoundUnit(symbol: 'mi/h', name: 'miles per hour');
  late final footPerMinute =
      _systemOfUnits.defineCompoundUnit(symbol: 'ft/min', name: 'feet per minute');
  late final footPerSecond =
      _systemOfUnits.defineCompoundUnit(symbol: 'ft/s', name: 'feet per second');

  // Nautical
  late final knot = _systemOfUnits.defineCompoundUnit(symbol: 'kt', name: 'knots', units: 'NM/h');

  // SI
  static Quantity<Speed> metersPerSecond(double amount) =>
      Quantity(unit: Speed().meterPerSecond, amount: amount);
  static Quantity<Speed> centimetersPerSecond(double amount) =>
      Quantity(unit: Speed().centimeterPerSecond, amount: amount);
  static Quantity<Speed> kilometersPerHour(double amount) =>
      Quantity(unit: Speed().kilometerPerHour, amount: amount);

  // Imperial/US
  static Quantity<Speed> feetPerMinute(double amount) =>
      Quantity(unit: Speed().footPerMinute, amount: amount);
  static Quantity<Speed> feetPerSecond(double amount) =>
      Quantity(unit: Speed().footPerSecond, amount: amount);
  static Quantity<Speed> milesPerHour(double amount) =>
      Quantity(unit: Speed().milePerHour, amount: amount);

  // Nautical
  static Quantity<Speed> knots(double amount) => Quantity(unit: Speed().knot, amount: amount);

  @override
  void defineSystemsOfUnits() {
    _systemOfUnits = CompoundSystemOfUnits<Speed, Length, Time>(this);
    meterPerSecond;

    systemsOfUnits.add(_systemOfUnits);
  }

  @override
  void loadAllUnits() {
    centimeterPerSecond;
    kilometerPerHour;
    milePerHour;
    footPerMinute;
    footPerSecond;
    knot;
  }
}
