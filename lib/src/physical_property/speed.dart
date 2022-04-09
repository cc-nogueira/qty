// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../measurement/derived_unit.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Speed, Length, Time> {
  factory Speed() => _instance ??= Speed._();

  Speed._() : super(Length(), Time(), kind: 'speed');

  static Speed? _instance;

  // SI
  late final Unit<Speed> meterPerSecond;
  late final Unit<Speed> centimeterPerSecond;
  late final Unit<Speed> kilometerPerHour;

  // Imperial/US
  late final Unit<Speed> milePerHour;
  late final Unit<Speed> footPerMinute;
  late final Unit<Speed> footPerSecond;

  // Nautical
  late final Unit<Speed> knot;

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
  void defineUnits() {
    final si = DerivedSystemOfUnits<Speed, Length, Time>(this);
    meterPerSecond = si.defineNamedUnit(symbol: 'm/s', name: 'meters per second');
    centimeterPerSecond = si.defineNamedUnit(symbol: 'cm/s', name: 'cintimeters per second');
    kilometerPerHour = si.defineNamedUnit(symbol: 'km/h', name: 'kilometers per hour');
    milePerHour = si.defineNamedUnit(symbol: 'mi/h', name: 'miles per hour');
    footPerMinute = si.defineNamedUnit(symbol: 'ft/min', name: 'feet per minute');
    footPerSecond = si.defineNamedUnit(symbol: 'ft/s', name: 'feet per second');
    knot = si.defineNamedUnit(symbol: 'kt', name: 'knots', units: 'NM/h');

    systemsOfUnits.add(si);
  }

  @override
  DividedUnits<Speed, Length, Time> deriveUnit(Unit<Length> a, Unit<Time> b,
          {String? symbol, String? name}) =>
      DividedUnits<Speed, Length, Time>(this, a, b, name: name, symbol: symbol);
}
