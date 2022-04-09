import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../measurement/unit_converter.dart';
import '../quantity/quantity.dart';

class TemperatureSystemOfUnits extends SystemOfUnits<Temperature> {
  TemperatureSystemOfUnits({required Temperature kind})
      : super(
            name: 'Temperature System of Units', kind: kind, unitConverter: TemperatureConverter());
}

class TemperatureConverter extends UnitConverter<Temperature> {
  @override
  QuantityConverter quantityConverter({required Unit fromUnit, required Unit toUnit}) {
    if (fromUnit == toUnit) return (double value) => value;
    if (fromUnit == Temperature().kelvin) {
      if (toUnit == Temperature().celcius) return (double k) => k - 273.15;
      if (toUnit == Temperature().fahrenheit) return (double k) => k * 1.8 - 459.67;
      if (toUnit == Temperature().rankine) return (double k) => k * 1.8;
    }
    if (fromUnit == Temperature().celcius) {
      if (toUnit == Temperature().kelvin) return (double c) => c + 273.15;
      if (toUnit == Temperature().fahrenheit) return (double c) => c * 1.8 + 32.0;
      if (toUnit == Temperature().rankine) return (double c) => (c + 273.15) * 1.8;
    }
    if (fromUnit == Temperature().fahrenheit) {
      if (toUnit == Temperature().kelvin) return (double f) => (f - 32) / 1.8 + 273.15;
      if (toUnit == Temperature().celcius) return (double f) => (f - 32.0) / 1.8;
      if (toUnit == Temperature().rankine) return (double f) => f + 459.67;
    }
    if (fromUnit == Temperature().rankine) {
      if (toUnit == Temperature().kelvin) return (double r) => r / 1.8;
      if (toUnit == Temperature().celcius) return (double r) => (r - 491.67) / 1.8;
      if (toUnit == Temperature().fahrenheit) return (double r) => r - 459.67;
    }
    throw ArgumentError('Unknown temperature convertion from $fromUnit to $toUnit');
  }
}

class Temperature extends PhysicalProperty<Temperature> {
  factory Temperature() => _instance ??= Temperature._();

  Temperature._() : super(kind: 'temperature', dimensionSymbol: 'Θ', quantitySymbol: 'T');

  static Temperature? _instance;

  late final Unit<Temperature> kelvin;
  late final Unit<Temperature> celcius;
  late final Unit<Temperature> fahrenheit;
  late final Unit<Temperature> rankine;

  static Quantity<Temperature> kelvins(double amount) =>
      Quantity(unit: Temperature().kelvin, amount: amount);
  static Quantity<Temperature> degreesCelcius(double amount) =>
      Quantity(unit: Temperature().celcius, amount: amount);
  static Quantity<Temperature> degreesFahrenheit(double amount) =>
      Quantity(unit: Temperature().fahrenheit, amount: amount);
  static Quantity<Temperature> degreesRankine(double amount) =>
      Quantity(unit: Temperature().rankine, amount: amount);

  @override
  void defineUnits() {
    final _system = TemperatureSystemOfUnits(kind: this);
    kelvin = _system.defineBaseUnit(symbol: 'K', name: 'Kelvin', factor: 1.0);
    celcius = _system.defineUnit(symbol: '°C', name: 'Celcius');
    fahrenheit = _system.defineUnit(symbol: '°F', name: 'Fahrenheit');
    rankine = _system.defineUnit(symbol: '°R', name: 'Rankine');

    systemsOfUnits.add(_system);
  }
}
