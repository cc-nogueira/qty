import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Volume physical property.
///
/// Configures Internation (SI) and Imperial (British) systems of units defining their [Volume] [Unit] instances.
/// All units are accessible by singleton method, static methods or by symbol.
/// Also provides Quantity constructors for common units.
class Volume extends PhysicalProperty<Volume> {
  factory Volume() => _instance ??= Volume._('volume');

  Volume._(String kind) : super(kind: kind) {
    _internationalSystemOfUnits = InternationalSystemOfUnits<Volume>(kind: this);
    _internationalSystemOfUnits.defineBaseUnit(symbol: 'l', name: 'litre', factor: 1.0);
    _internationalSystemOfUnits.defineUnit(
        symbol: 'mm3', name: 'cubic millimeter', factor: 0.000001);
    _internationalSystemOfUnits.defineUnit(symbol: 'cm3', name: 'cubic centimeter', factor: 0.001);
    _internationalSystemOfUnits.defineUnit(symbol: 'dm3', name: 'cubic decimeter', factor: 1.0);
    _internationalSystemOfUnits.defineUnit(symbol: 'm3', name: 'cubic meter', factor: 1000.0);

    _imperialSystemOfUnits = ImperialSystemOfUnits<Volume>(kind: this);
    _imperialSystemOfUnits.defineBaseUnit(symbol: 'gal', name: 'galon', factor: 4.54609);
    _imperialSystemOfUnits.defineUnit(symbol: 'fl oz', name: 'fluid ounce', factor: 1.0 / 160.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'gi', name: 'gill', factor: 1.0 / 32.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'pt', name: 'pint', factor: 1.0 / 8.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'qt', name: 'quart', factor: 1.0 / 4.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'peck', name: 'peck', factor: 2.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'bu', name: 'bushel', factor: 8.0);
    _imperialSystemOfUnits.defineUnit(symbol: 'qr', name: 'quarter', factor: 64.0);

    systemsOfUnits.addAll([_internationalSystemOfUnits, _imperialSystemOfUnits]);
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
  static Quantity<Volume> liters({required double amount}) => Quantity(unit: l, amount: amount);
  static Quantity<Volume> galons({required double amount}) => Quantity(unit: gal, amount: amount);
  static Quantity<Volume> ounces({required double amount}) => Quantity(unit: flOz, amount: amount);
  static Quantity<Volume> gills({required double amount}) => Quantity(unit: gi, amount: amount);
  static Quantity<Volume> pints({required double amount}) => Quantity(unit: pt, amount: amount);
  static Quantity<Volume> quarts({required double amount}) => Quantity(unit: qt, amount: amount);
  static Quantity<Volume> pecks({required double amount}) => Quantity(unit: peck, amount: amount);
  static Quantity<Volume> bushels({required double amount}) => Quantity(unit: bu, amount: amount);
  static Quantity<Volume> quarters({required double amount}) => Quantity(unit: qr, amount: amount);

  static Unit<Volume> get mm3 => Volume().mm3Unit;
  static Unit<Volume> get cm3 => Volume().cm3Unit;
  static Unit<Volume> get dm3 => Volume().dm3Unit;
  static Unit<Volume> get m3 => Volume().m3Unit;
  static Unit<Volume> get l => Volume().lUnit;
  static Unit<Volume> get flOz => Volume().flOzUnit;
  static Unit<Volume> get gi => Volume().giUnit;
  static Unit<Volume> get pt => Volume().ptUnit;
  static Unit<Volume> get qt => Volume().qtUnit;
  static Unit<Volume> get gal => Volume().galUnit;
  static Unit<Volume> get peck => Volume().peckUnit;
  static Unit<Volume> get bu => Volume().buUnit;
  static Unit<Volume> get qr => Volume().qrUnit;

  Unit<Volume> get mm3Unit => _internationalSystemOfUnits.unitWith(symbol: 'mm3')!;
  Unit<Volume> get cm3Unit => _internationalSystemOfUnits.unitWith(symbol: 'cm3')!;
  Unit<Volume> get dm3Unit => _internationalSystemOfUnits.unitWith(symbol: 'dm3')!;
  Unit<Volume> get m3Unit => _internationalSystemOfUnits.unitWith(symbol: 'm3')!;
  Unit<Volume> get lUnit => _internationalSystemOfUnits.unitWith(symbol: 'l')!;
  Unit<Volume> get flOzUnit => _imperialSystemOfUnits.unitWith(symbol: 'fl oz')!;
  Unit<Volume> get giUnit => _imperialSystemOfUnits.unitWith(symbol: 'gi')!;
  Unit<Volume> get ptUnit => _imperialSystemOfUnits.unitWith(symbol: 'pt')!;
  Unit<Volume> get qtUnit => _imperialSystemOfUnits.unitWith(symbol: 'qt')!;
  Unit<Volume> get galUnit => _imperialSystemOfUnits.unitWith(symbol: 'gal')!;
  Unit<Volume> get peckUnit => _imperialSystemOfUnits.unitWith(symbol: 'peck')!;
  Unit<Volume> get buUnit => _imperialSystemOfUnits.unitWith(symbol: 'bu')!;
  Unit<Volume> get qrUnit => _imperialSystemOfUnits.unitWith(symbol: 'qr')!;
}
