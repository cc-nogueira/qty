// ignore_for_file: non_constant_identifier_names
import '../measurement/compound_physical_property.dart';
import '../measurement/compound_unit.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Length, Time> {
  factory Speed() => _instance ??= Speed._('speed');

  Speed._(String kind) : super(Length(), Time(), kind: kind);

  static Speed? _instance;

  static Quantity<CompoundPhysicalProperty<Length, Time>> metersPerSecond(
          {required double amount}) =>
      Quantity(unit: m_s, amount: amount);

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

  static CompoundUnit<Length, Time, Speed> get m_s =>
      Speed().unitWith(symbol: 'm/s')!;
  static CompoundUnit<Length, Time, Speed> get km_h =>
      Speed().unitWith(symbol: 'km/h')!;
  static CompoundUnit<Length, Time, Speed> get mi_h =>
      Speed().unitWith(symbol: 'mi/h')!;
  static CompoundUnit<Length, Time, Speed> get ft_min =>
      Speed().unitWith(symbol: 'ft/min')!;
  static CompoundUnit<Length, Time, Speed> get ft_s =>
      Speed().unitWith(symbol: 'ft/s')!;
  static CompoundUnit<Length, Time, Speed> get kt =>
      Speed().unitWith(symbol: 'nm/h')!;

  @override
  CompoundUnit<Length, Time, Speed>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as CompoundUnit<Length, Time, Speed>?;

  @override
  DividedUnits<Length, Time, Speed> compoundUnit(
    LinearConvertibleUnit<Length> a,
    LinearConvertibleUnit<Time> b,
  ) =>
      DividedUnits<Length, Time, Speed>(this, a, b);
}
