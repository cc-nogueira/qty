// ignore_for_file: non_constant_identifier_names
import '../measurement/compound_measurement.dart';
import '../measurement/measurement.dart';
import 'length.dart';
import 'time.dart';

class Speed extends DividedPhysicalProperties<Length, Time> {
  factory Speed() => _instance ??= Speed._internal('speed');

  Speed._internal(String kind) : super(Length(), Time(), kind: kind);

  static Speed? _instance;

  static LinearConvertibleUnit get m_s => Speed().unitWith(symbol: 'm/s')!;
  static LinearConvertibleUnit get km_h => Speed().unitWith(symbol: 'km/h')!;
  static LinearConvertibleUnit get mi_h => Speed().unitWith(symbol: 'mi/h')!;
  static LinearConvertibleUnit get cm_s => Speed().unitWith(symbol: 'cm/s')!;
  static LinearConvertibleUnit get kt => Speed().unitWith(symbol: 'nm/h')!;
}
