// ignore_for_file: non_constant_identifier_names
import '../measurement/compound_physical_property.dart';
import '../measurement/compound_system_of_units.dart';
import '../measurement/compound_unit.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Length, Time> {
  factory Speed() => _instance ??= Speed._('speed');

  Speed._(String kind) : super(Length(), Time(), kind: kind) {
    _systemOfUnits = CompoundSystemOfUnits(this);
    _systemOfUnits.defineNamedUnit(symbol: 'm/s', name: 'meters per second');
    _systemOfUnits.defineNamedUnit(
        symbol: 'cm/s', name: 'cintimeters per second');
    _systemOfUnits.defineNamedUnit(symbol: 'km/h', name: 'kilometers per hour');
    _systemOfUnits.defineNamedUnit(symbol: 'mi/h', name: 'miles per hour');
    _systemOfUnits.defineNamedUnit(symbol: 'ft/min', name: 'feet per minute');
    _systemOfUnits.defineNamedUnit(symbol: 'ft/s', name: 'feet per second');
    _systemOfUnits.defineNamedUnit(symbol: 'kt', name: 'knots', units: 'nm/h');

    systemsOfMeasurent.add(_systemOfUnits);
  }

  static Speed? _instance;
  late CompoundSystemOfUnits<Length, Time, Speed> _systemOfUnits;

  static Quantity<CompoundPhysicalProperty<Length, Time>> metersPerSecond(
          {required double amount}) =>
      Quantity(unit: m_s, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> centimetersPerSecond(
          {required double amount}) =>
      Quantity(unit: cm_s, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> kilometersPerHour(
          {required double amount}) =>
      Quantity(unit: km_h, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> feetPerMinute(
          {required double amount}) =>
      Quantity(unit: ft_min, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> feetPerSecond(
          {required double amount}) =>
      Quantity(unit: ft_s, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> milesPerHour(
          {required double amount}) =>
      Quantity(unit: mi_h, amount: amount);
  static Quantity<CompoundPhysicalProperty<Length, Time>> knots(
          {required double amount}) =>
      Quantity(unit: kt, amount: amount);

  static CompoundUnit<Length, Time, Speed> get m_s => Speed().m_sUnit;
  static CompoundUnit<Length, Time, Speed> get cm_s => Speed().cm_sUnit;
  static CompoundUnit<Length, Time, Speed> get km_h => Speed().km_hUnit;
  static CompoundUnit<Length, Time, Speed> get mi_h => Speed().mi_hUnit;
  static CompoundUnit<Length, Time, Speed> get ft_min => Speed().ft_minUnit;
  static CompoundUnit<Length, Time, Speed> get ft_s => Speed().ft_sUnit;
  static CompoundUnit<Length, Time, Speed> get kt => Speed().ktUnit;

  CompoundUnit<Length, Time, Speed> get m_sUnit =>
      _systemOfUnits.unitWith(symbol: 'm/s')!;
  CompoundUnit<Length, Time, Speed> get cm_sUnit =>
      _systemOfUnits.unitWith(symbol: 'cm/s')!;
  CompoundUnit<Length, Time, Speed> get km_hUnit =>
      _systemOfUnits.unitWith(symbol: 'km/h')!;
  CompoundUnit<Length, Time, Speed> get mi_hUnit =>
      _systemOfUnits.unitWith(symbol: 'mi/h')!;
  CompoundUnit<Length, Time, Speed> get ft_minUnit =>
      _systemOfUnits.unitWith(symbol: 'ft/min')!;
  CompoundUnit<Length, Time, Speed> get ft_sUnit =>
      _systemOfUnits.unitWith(symbol: 'ft/s')!;
  CompoundUnit<Length, Time, Speed> get ktUnit =>
      _systemOfUnits.unitWith(symbol: 'kt')!;

  // @override
  // CompoundUnit<Length, Time, Speed>? unitWith({required String symbol}) =>
  //     super.unitWith(symbol: symbol) as CompoundUnit<Length, Time, Speed>?;

  @override
  DividedUnits<Length, Time, Speed> compoundUnit(
          LinearConvertibleUnit<Length> a, LinearConvertibleUnit<Time> b,
          {String? symbol, String? name}) =>
      DividedUnits<Length, Time, Speed>(this, a, b, name: name, symbol: symbol);
}
