import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Volume physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Volume] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Volume extends LinearConvertiblePhysicalProperty {
  factory Volume() => _instance ??= Volume._('volume');

  Volume._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits =
        InternationalSystemOfUnits<Volume>(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(
        symbol: 'l', name: 'litre', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'mm3', name: 'cubic millimeter', factor: 0.000001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'cm3', name: 'cubic centimeter', factor: 0.001);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'dm3', name: 'cubic decimeter', factor: 1.0);
    _internationalSystemOfUnits.defineUnitWithFactor(
        symbol: 'm3', name: 'cubic meter', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits<Volume>(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(
        symbol: 'gal', name: 'galon', factor: 4.54609);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'fl oz', name: 'fluid ounce', factor: 1.0 / 160.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'gi', name: 'gill', factor: 1.0 / 32.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'pt', name: 'pint', factor: 1.0 / 8.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'qt', name: 'quart', factor: 1.0 / 4.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'peck', name: 'peck', factor: 2.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'bu', name: 'bushel', factor: 8.0);
    _imperialSystemOfUnits.defineUnitWithFactor(
        symbol: 'qr', name: 'quarter', factor: 64.0);

    systemsOfMeasurent
        .addAll([_internationalSystemOfUnits, _imperialSystemOfUnits]);
  }

  static Volume? _instance;
  late InternationalSystemOfUnits<Volume> _internationalSystemOfUnits;
  late ImperialSystemOfUnits<Volume> _imperialSystemOfUnits;

  static Quantity<Volume> cubicMillimimeters({required double amount}) =>
      Quantity(unit: mm3, amount: amount);
  static Quantity<Volume> cubicCentimeters({required double amount}) =>
      Quantity(unit: cm3, amount: amount);
  static Quantity<Volume> cubicDecimimeters({required double amount}) =>
      Quantity(unit: dm3, amount: amount);
  static Quantity<Volume> cubicMeters({required double amount}) =>
      Quantity(unit: m3, amount: amount);
  static Quantity<Volume> liters({required double amount}) =>
      Quantity(unit: l, amount: amount);
  static Quantity<Volume> galons({required double amount}) =>
      Quantity(unit: gal, amount: amount);
  static Quantity<Volume> ounces({required double amount}) =>
      Quantity(unit: flOz, amount: amount);
  static Quantity<Volume> gills({required double amount}) =>
      Quantity(unit: gi, amount: amount);
  static Quantity<Volume> pints({required double amount}) =>
      Quantity(unit: pt, amount: amount);
  static Quantity<Volume> quarts({required double amount}) =>
      Quantity(unit: qt, amount: amount);
  static Quantity<Volume> pecks({required double amount}) =>
      Quantity(unit: peck, amount: amount);
  static Quantity<Volume> bushels({required double amount}) =>
      Quantity(unit: bu, amount: amount);
  static Quantity<Volume> quarters({required double amount}) =>
      Quantity(unit: qr, amount: amount);

  static LinearConvertibleUnit<Volume> get mm3 => Volume().mm3Unit;
  static LinearConvertibleUnit<Volume> get cm3 => Volume().cm3Unit;
  static LinearConvertibleUnit<Volume> get dm3 => Volume().dm3Unit;
  static LinearConvertibleUnit<Volume> get m3 => Volume().m3Unit;
  static LinearConvertibleUnit<Volume> get l => Volume().lUnit;
  static LinearConvertibleUnit<Volume> get flOz => Volume().flOzUnit;
  static LinearConvertibleUnit<Volume> get gi => Volume().giUnit;
  static LinearConvertibleUnit<Volume> get pt => Volume().ptUnit;
  static LinearConvertibleUnit<Volume> get qt => Volume().qtUnit;
  static LinearConvertibleUnit<Volume> get gal => Volume().galUnit;
  static LinearConvertibleUnit<Volume> get peck => Volume().peckUnit;
  static LinearConvertibleUnit<Volume> get bu => Volume().buUnit;
  static LinearConvertibleUnit<Volume> get qr => Volume().qrUnit;

  LinearConvertibleUnit<Volume> get mm3Unit =>
      _internationalSystemOfUnits.unitWith(symbol: 'mm3')!;
  LinearConvertibleUnit<Volume> get cm3Unit =>
      _internationalSystemOfUnits.unitWith(symbol: 'cm3')!;
  LinearConvertibleUnit<Volume> get dm3Unit =>
      _internationalSystemOfUnits.unitWith(symbol: 'dm3')!;
  LinearConvertibleUnit<Volume> get m3Unit =>
      _internationalSystemOfUnits.unitWith(symbol: 'm3')!;
  LinearConvertibleUnit<Volume> get lUnit =>
      _internationalSystemOfUnits.unitWith(symbol: 'l')!;
  LinearConvertibleUnit<Volume> get flOzUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'fl oz')!;
  LinearConvertibleUnit<Volume> get giUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'gi')!;
  LinearConvertibleUnit<Volume> get ptUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'pt')!;
  LinearConvertibleUnit<Volume> get qtUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'qt')!;
  LinearConvertibleUnit<Volume> get galUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'gal')!;
  LinearConvertibleUnit<Volume> get peckUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'peck')!;
  LinearConvertibleUnit<Volume> get buUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'bu')!;
  LinearConvertibleUnit<Volume> get qrUnit =>
      _imperialSystemOfUnits.unitWith(symbol: 'qr')!;
}
