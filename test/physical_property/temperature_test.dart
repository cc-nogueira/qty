import 'package:qty/qty.dart';
import 'package:test/test.dart';

void main() {
  test('Temperature singleton', () {
    final anUnitKind = Temperature();
    final sameUnitKind = Temperature();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Temperature units', () {
    final temp = Temperature();
    final none = temp.unitWith(symbol: 'unknown');
    final k = temp.unitWith(symbol: 'K')!;
    final c = temp.unitWith(symbol: '°C')!;
    final f = temp.unitWith(symbol: '°F')!;
    final r = temp.unitWith(symbol: '°R')!;

    expect(none, isNull);
    expect(k.symbol, 'K');
    expect(k.name, 'Kelvin');
    expect(c.symbol, '°C');
    expect(c.name, 'Celcius');
    expect(f.symbol, '°F');
    expect(f.name, 'Fahrenheit');
    expect(r.symbol, '°R');
    expect(r.name, 'Rankine');
    expect(k, same(Temperature().kelvin));
    expect(c, same(Temperature().celcius));
    expect(f, same(Temperature().fahrenheit));
    expect(r, same(Temperature().rankine));
  });

  test('Temperature convertion factors', () {
    expect(Temperature().kelvin.quantityConverterTo(Temperature().celcius)(1.0), -272.15);
    expect(Temperature().kelvin.quantityConverterTo(Temperature().celcius)(100.0),
        closeToValue(-173.15));
    expect(Temperature().kelvin.quantityConverterTo(Temperature().fahrenheit)(1.0), -457.87);
    expect(Temperature().kelvin.quantityConverterTo(Temperature().fahrenheit)(100.0), -279.67);
    expect(Temperature().kelvin.quantityConverterTo(Temperature().rankine)(1.0), 1.8);
    expect(Temperature().kelvin.quantityConverterTo(Temperature().rankine)(100.0), 180.0);

    expect(Temperature().celcius.quantityConverterTo(Temperature().kelvin)(1.0), 274.15);
    expect(Temperature().celcius.quantityConverterTo(Temperature().kelvin)(100.0), 373.15);
    expect(Temperature().celcius.quantityConverterTo(Temperature().fahrenheit)(1.0), 33.8);
    expect(Temperature().celcius.quantityConverterTo(Temperature().fahrenheit)(100.0), 212.0);
    expect(Temperature().celcius.quantityConverterTo(Temperature().rankine)(1.0),
        closeToValue(493.47));
    expect(Temperature().celcius.quantityConverterTo(Temperature().rankine)(100.0), 671.67);

    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().kelvin)(32.0), 273.15);
    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().kelvin)(212.0), 373.15);
    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().celcius)(32.0), 0.0);
    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().celcius)(212.0), 100.0);
    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().rankine)(1.0), 460.67);
    expect(Temperature().fahrenheit.quantityConverterTo(Temperature().rankine)(100.0),
        closeToValue(559.67));

    expect(Temperature().rankine.quantityConverterTo(Temperature().kelvin)(18.0), 10.0);
    expect(Temperature().rankine.quantityConverterTo(Temperature().kelvin)(180.0), 100.0);
    expect(Temperature().rankine.quantityConverterTo(Temperature().celcius)(18.0), -263.15);
    expect(Temperature().rankine.quantityConverterTo(Temperature().celcius)(180.0), -173.15);
    expect(Temperature().rankine.quantityConverterTo(Temperature().fahrenheit)(1.0), -458.67);
    expect(Temperature().rankine.quantityConverterTo(Temperature().fahrenheit)(180.0), -279.67);
  });
}

Matcher closeToValue(double value) => inInclusiveRange(value - 0.000000001, value + 0.000000001);
