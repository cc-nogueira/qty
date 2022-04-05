import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../measurement/unit_converter.dart';
import '../quantity/quantity.dart';

class TemperatureSystemOfUnits extends SystemOfMeasurent {
  TemperatureSystemOfUnits({required Temperature kind})
      : super(
            name: 'Temperature System of Units',
            kind: kind,
            unitConverter: TemperatureConverter());
}

class TemperatureConverter extends UnitConverter {
  @override
  QuantityConverter quantityConverter(
      {required Unit fromUnit, required Unit toUnit}) {
    if (fromUnit == toUnit) return (double value) => value;
    if (fromUnit == Temperature.K) {
      if (toUnit == Temperature.C) return (double k) => k - 273.15;
      if (toUnit == Temperature.F) return (double k) => k * 1.8 - 459.67;
      if (toUnit == Temperature.R) return (double k) => k * 1.8;
    }
    if (fromUnit == Temperature.C) {
      if (toUnit == Temperature.K) return (double c) => c + 273.15;
      if (toUnit == Temperature.F) return (double c) => c * 1.8 + 32.0;
      if (toUnit == Temperature.R) return (double c) => (c + 273.15) * 1.8;
    }
    if (fromUnit == Temperature.F) {
      if (toUnit == Temperature.K) return (double f) => (f - 32) / 1.8 + 273.15;
      if (toUnit == Temperature.C) return (double f) => (f - 32.0) / 1.8;
      if (toUnit == Temperature.R) return (double f) => f + 459.67;
    }
    if (fromUnit == Temperature.R) {
      if (toUnit == Temperature.K) return (double r) => r / 1.8;
      if (toUnit == Temperature.C) return (double r) => (r - 491.67) / 1.8;
      if (toUnit == Temperature.F) return (double r) => r - 459.67;
    }
    throw ArgumentError(
        'Unknown temperature convertion from $fromUnit to $toUnit');
  }
}

class Temperature extends PhysicalProperty {
  factory Temperature() => _instance ??= Temperature._('temperature');

  Temperature._(String kind) : super(kind: kind) {
    final _system = TemperatureSystemOfUnits(kind: this);
    kUnit = _system.defineBaseUnit(symbol: 'K', name: 'Kelvin', factor: 1.0);
    cUnit = _system.defineUnit(symbol: '°C', name: 'degrees Celcius');
    fUnit = _system.defineUnit(symbol: '°F', name: 'degrees Fahrenheit');
    rUnit = _system.defineUnit(symbol: '°R', name: 'degrees Rankine');

    systemsOfMeasurent.add(_system);
  }

  static Temperature? _instance;

  static Quantity kelvins({required double amount}) =>
      Quantity(unit: K, amount: amount);
  static Quantity degreesCelcius({required double amount}) =>
      Quantity(unit: C, amount: amount);
  static Quantity degreesFahrenheit({required double amount}) =>
      Quantity(unit: F, amount: amount);
  static Quantity degreesRankine({required double amount}) =>
      Quantity(unit: R, amount: amount);

  static Unit get K => Temperature().kUnit;
  static Unit get C => Temperature().cUnit;
  static Unit get F => Temperature().fUnit;
  static Unit get R => Temperature().rUnit;

  late final Unit kUnit;
  late final Unit cUnit;
  late final Unit fUnit;
  late final Unit rUnit;
}
