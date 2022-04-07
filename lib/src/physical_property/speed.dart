// ignore_for_file: non_constant_identifier_names
import '../measurement/compound_physical_property.dart';
import '../measurement/compound_system_of_units.dart';
import '../measurement/compound_unit.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Speed, Length, Time> {
  factory Speed() => _instance ??= Speed._('speed');

  Speed._(String kind) : super(Length(), Time(), kind: kind) {
    _systemOfUnits = CompoundSystemOfUnits(this);
    _systemOfUnits.defineNamedUnit(symbol: 'm/s', name: 'meters per second');
    _systemOfUnits.defineNamedUnit(symbol: 'cm/s', name: 'cintimeters per second');
    _systemOfUnits.defineNamedUnit(symbol: 'km/h', name: 'kilometers per hour');
    _systemOfUnits.defineNamedUnit(symbol: 'mi/h', name: 'miles per hour');
    _systemOfUnits.defineNamedUnit(symbol: 'ft/min', name: 'feet per minute');
    _systemOfUnits.defineNamedUnit(symbol: 'ft/s', name: 'feet per second');
    _systemOfUnits.defineNamedUnit(symbol: 'kt', name: 'knots', units: 'nm/h');

    systemsOfMeasurement.add(_systemOfUnits);
  }

  static Speed? _instance;
  late CompoundSystemOfUnits<Speed, Length, Time> _systemOfUnits;

  static Quantity<Speed> metersPerSecond({required double amount}) =>
      Quantity(unit: m_s, amount: amount);
  static Quantity<Speed> centimetersPerSecond({required double amount}) =>
      Quantity(unit: cm_s, amount: amount);
  static Quantity<Speed> kilometersPerHour({required double amount}) =>
      Quantity(unit: km_h, amount: amount);
  static Quantity<Speed> feetPerMinute({required double amount}) =>
      Quantity(unit: ft_min, amount: amount);
  static Quantity<Speed> feetPerSecond({required double amount}) =>
      Quantity(unit: ft_s, amount: amount);
  static Quantity<Speed> milesPerHour({required double amount}) =>
      Quantity(unit: mi_h, amount: amount);
  static Quantity<Speed> knots({required double amount}) => Quantity(unit: kt, amount: amount);

  static CompoundUnit<Speed, Length, Time> get m_s => Speed().m_sUnit;
  static CompoundUnit<Speed, Length, Time> get cm_s => Speed().cm_sUnit;
  static CompoundUnit<Speed, Length, Time> get km_h => Speed().km_hUnit;
  static CompoundUnit<Speed, Length, Time> get mi_h => Speed().mi_hUnit;
  static CompoundUnit<Speed, Length, Time> get ft_min => Speed().ft_minUnit;
  static CompoundUnit<Speed, Length, Time> get ft_s => Speed().ft_sUnit;
  static CompoundUnit<Speed, Length, Time> get kt => Speed().ktUnit;

  CompoundUnit<Speed, Length, Time> get m_sUnit => _systemOfUnits.unitWith(symbol: 'm/s')!;
  CompoundUnit<Speed, Length, Time> get cm_sUnit => _systemOfUnits.unitWith(symbol: 'cm/s')!;
  CompoundUnit<Speed, Length, Time> get km_hUnit => _systemOfUnits.unitWith(symbol: 'km/h')!;
  CompoundUnit<Speed, Length, Time> get mi_hUnit => _systemOfUnits.unitWith(symbol: 'mi/h')!;
  CompoundUnit<Speed, Length, Time> get ft_minUnit => _systemOfUnits.unitWith(symbol: 'ft/min')!;
  CompoundUnit<Speed, Length, Time> get ft_sUnit => _systemOfUnits.unitWith(symbol: 'ft/s')!;
  CompoundUnit<Speed, Length, Time> get ktUnit => _systemOfUnits.unitWith(symbol: 'kt')!;

  // @override
  // CompoundUnit<Speed, Length, Time>? unitWith({required String symbol}) =>
  //     super.unitWith(symbol: symbol) as CompoundUnit<Speed, Length, Time>?;

  @override
  DividedUnits<Speed, Length, Time> compoundUnit(
          LinearConvertibleUnit<Length> a, LinearConvertibleUnit<Time> b,
          {String? symbol, String? name}) =>
      DividedUnits<Speed, Length, Time>(this, a, b, name: name, symbol: symbol);
}
