// ignore_for_file: non_constant_identifier_names
import '../measurement/derived_physical_property.dart';
import '../measurement/derived_system_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Speed, Length, Time> {
  factory Speed() => _instance ??= Speed._();

  Speed._() : super(Length(), Time(), kind: 'speed', dimensionSymbol: 'v', quantitySymbol: 'v');

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
    final derived = DerivedSystemOfUnits<Speed, Length, Time>(this);
    meterPerSecond = derived.defineNamedUnit(symbol: 'm/s', name: 'meters per second');
    centimeterPerSecond = derived.defineNamedUnit(symbol: 'cm/s', name: 'cintimeters per second');
    kilometerPerHour = derived.defineNamedUnit(symbol: 'km/h', name: 'kilometers per hour');
    milePerHour = derived.defineNamedUnit(symbol: 'mi/h', name: 'miles per hour');
    footPerMinute = derived.defineNamedUnit(symbol: 'ft/min', name: 'feet per minute');
    footPerSecond = derived.defineNamedUnit(symbol: 'ft/s', name: 'feet per second');
    knot = derived.defineNamedUnit(symbol: 'kt', name: 'knots', units: 'NM/h');

    systemsOfUnits.add(derived);
  }
}
