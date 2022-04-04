// ignore_for_file: non_constant_identifier_names
import '../measurement/compound_measurement.dart';
import '../measurement/measurement.dart';
import '../quantity/quantity.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Length, Time> {
  factory Speed() => _instance ??= Speed._internal('speed');

  Speed._internal(String kind) : super(Length(), Time(), kind: kind);

  static Speed? _instance;

  static Quantity metersPerSecond({required double amount}) =>
      Quantity(unit: m_s, amount: amount);

  static Quantity kilometersPerHour({required double amount}) =>
      Quantity(unit: km_h, amount: amount);
  static Quantity feetPerMinute({required double amount}) =>
      Quantity(unit: ft_min, amount: amount);
  static Quantity feetPerSecond({required double amount}) =>
      Quantity(unit: ft_s, amount: amount);
  static Quantity milesPerHour({required double amount}) =>
      Quantity(unit: mi_h, amount: amount);
  static Quantity knots({required double amount}) =>
      Quantity(unit: kt, amount: amount);

  static LinearConvertibleUnit get m_s => Speed().unitWith(symbol: 'm/s')!;
  static LinearConvertibleUnit get km_h => Speed().unitWith(symbol: 'km/h')!;
  static LinearConvertibleUnit get mi_h => Speed().unitWith(symbol: 'mi/h')!;
  static LinearConvertibleUnit get ft_min =>
      Speed().unitWith(symbol: 'ft/min')!;
  static LinearConvertibleUnit get ft_s => Speed().unitWith(symbol: 'ft/s')!;
  static LinearConvertibleUnit get kt => Speed().unitWith(symbol: 'nm/h')!;
}
