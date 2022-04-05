// ignore_for_file: non_constant_identifier_names

import 'package:qty/temperature.dart';
import 'package:qty/volume.dart';
import 'package:test/test.dart';

void main() {
  test('Speed singleton', () {
    final anUnitKind = Temperature();
    final sameUnitKind = Temperature();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Speed units', () {
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
    expect(c.name, 'degrees Celcius');
    expect(f.symbol, '°F');
    expect(f.name, 'degrees Fahrenheit');
    expect(r.symbol, '°R');
    expect(r.name, 'degrees Rankine');
    expect(k, same(Temperature.K));
    expect(c, same(Temperature.C));
    expect(f, same(Temperature.F));
    expect(r, same(Temperature.R));
  });

  test('Speed convertion factors', () {
    expect(Temperature.K.quantityConverterTo(Temperature.C)(1.0), -272.15);
    expect(Temperature.K.quantityConverterTo(Temperature.C)(100.0),
        closeToValue(-173.15));
    expect(Temperature.K.quantityConverterTo(Temperature.F)(1.0), -457.87);
    expect(Temperature.K.quantityConverterTo(Temperature.F)(100.0), -279.67);
    expect(Temperature.K.quantityConverterTo(Temperature.R)(1.0), 1.8);
    expect(Temperature.K.quantityConverterTo(Temperature.R)(100.0), 180.0);

    expect(Temperature.C.quantityConverterTo(Temperature.K)(1.0), 274.15);
    expect(Temperature.C.quantityConverterTo(Temperature.K)(100.0), 373.15);
    expect(Temperature.C.quantityConverterTo(Temperature.F)(1.0), 33.8);
    expect(Temperature.C.quantityConverterTo(Temperature.F)(100.0), 212.0);
    expect(Temperature.C.quantityConverterTo(Temperature.R)(1.0),
        closeToValue(493.47));
    expect(Temperature.C.quantityConverterTo(Temperature.R)(100.0), 671.67);

    expect(Temperature.F.quantityConverterTo(Temperature.K)(32.0), 273.15);
    expect(Temperature.F.quantityConverterTo(Temperature.K)(212.0), 373.15);
    expect(Temperature.F.quantityConverterTo(Temperature.C)(32.0), 0.0);
    expect(Temperature.F.quantityConverterTo(Temperature.C)(212.0), 100.0);
    expect(Temperature.F.quantityConverterTo(Temperature.R)(1.0), 460.67);
    expect(Temperature.F.quantityConverterTo(Temperature.R)(100.0),
        closeToValue(559.67));

    expect(Temperature.R.quantityConverterTo(Temperature.K)(18.0), 10.0);
    expect(Temperature.R.quantityConverterTo(Temperature.K)(180.0), 100.0);
    expect(Temperature.R.quantityConverterTo(Temperature.C)(18.0), -263.15);
    expect(Temperature.R.quantityConverterTo(Temperature.C)(180.0), -173.15);
    expect(Temperature.R.quantityConverterTo(Temperature.F)(1.0), -458.67);
    expect(Temperature.R.quantityConverterTo(Temperature.F)(180.0), -279.67);
  });
}

Matcher closeToValue(double value) =>
    inInclusiveRange(value - 0.000000001, value + 0.000000001);
