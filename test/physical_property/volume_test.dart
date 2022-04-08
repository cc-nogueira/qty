import 'package:qty/qty.dart';
import 'package:test/test.dart';

void main() {
  test('Volume singleton', () {
    final anUnitKind = Volume();
    final sameUnitKind = Volume();
    final anotherUnitKind = Mass();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Volume units', () {
    final volume = Volume();
    final none = volume.unitWith(symbol: 'unknown');
    final mm3 = volume.unitWith(symbol: 'mm3')!;
    final cm3 = volume.unitWith(symbol: 'cm3')!;
    final dm3 = volume.unitWith(symbol: 'dm3')!;
    final m3 = volume.unitWith(symbol: 'm3')!;
    final l = volume.unitWith(symbol: 'l')!;
    expect(none, isNull);
    expect(mm3.symbol, 'mm3');
    expect(mm3.name, 'cubic millimeter');
    expect(cm3.symbol, 'cm3');
    expect(cm3.name, 'cubic centimeter');
    expect(dm3.symbol, 'dm3');
    expect(dm3.name, 'cubic decimeter');
    expect(m3.symbol, 'm3');
    expect(m3.name, 'cubic meter');
    expect(l.symbol, 'l');
    expect(l.name, 'liter');
    expect(cm3, same(Volume().cubicCentimeter));
    expect(dm3, same(Volume().cubicDecimeter));
    expect(m3, same(Volume().cubicMeter));
    expect(l, same(Volume().liter));
  });

  test('Volume convertion factors', () {
    expect(Volume().liter.quantityConverterTo(Volume().cubicMeter)(1.0), 0.001);
    expect(Volume().liter.quantityConverterTo(Volume().cubicCentimeter)(1.0), 1000.0);
    expect(Volume().cubicMeter.quantityConverterTo(Volume().cubicDecimeter)(1.0), 1000.0);
    expect(Volume().cubicMeter.quantityConverterTo(Volume().liter)(1.0), 1000.0);
    expect(Volume().cubicMeter.quantityConverterTo(Volume().cubicCentimeter)(1.0), 1000000.0);
    expect(Volume().cubicMeter.quantityConverterTo(Volume().cubicMillimeter)(1.0), 1000000000.0);
    expect(Volume().cubicDecimeter.quantityConverterTo(Volume().cubicMeter)(1.0), 0.001);
    expect(Volume().cubicDecimeter.quantityConverterTo(Volume().cubicCentimeter)(1.0), 1000.0);
    expect(Volume().cubicCentimeter.quantityConverterTo(Volume().cubicDecimeter)(1.0), 0.001);
    expect(Volume().cubicCentimeter.quantityConverterTo(Volume().liter)(1.0), 0.001);
    expect(Volume().cubicCentimeter.quantityConverterTo(Volume().cubicMeter)(1.0), 0.000001);
    expect(Volume().cubicMillimeter.quantityConverterTo(Volume().cubicCentimeter)(1.0), 0.001);
    expect(Volume().cubicMillimeter.quantityConverterTo(Volume().liter)(1.0), 0.000001);
    expect(Volume().gallon.quantityConverterTo(Volume().pint)(1.0), 8.0);
    expect(Volume().gallon.quantityConverterTo(Volume().fluidOunce)(1.0), 160.0);
    expect(Volume().quart.quantityConverterTo(Volume().gallon)(1.0), 1.0 / 4.0);
    expect(Volume().pint.quantityConverterTo(Volume().fluidOunce)(1.0), 20.0);
    expect(Volume().gallon.quantityConverterTo(Volume().cubicMillimeter)(1.0), 4546090.0);
    expect(Volume().gallon.quantityConverterTo(Volume().liter)(1.0), 4.54609);
  });
}
