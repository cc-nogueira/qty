import 'package:qty/qty.dart';
import 'package:test/test.dart';

void main() {
  test('Length singleton', () {
    final anUnitKind = Length();
    final sameUnitKind = Length();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Length units', () {
    final none = Length().unitWith(symbol: 'unknown');
    final mm = Length().unitWith(symbol: 'mm')!;
    final cm = Length().unitWith(symbol: 'cm')!;
    final dm = Length().unitWith(symbol: 'dm')!;
    final m = Length().unitWith(symbol: 'm')!;
    final km = Length().unitWith(symbol: 'km')!;
    expect(none, isNull);
    expect(mm.symbol, 'mm');
    expect(mm.name, 'millimeter');
    expect(cm.symbol, 'cm');
    expect(cm.name, 'centimeter');
    expect(dm.symbol, 'dm');
    expect(dm.name, 'decimeter');
    expect(m.symbol, 'm');
    expect(m.name, 'meter');
    expect(km.symbol, 'km');
    expect(km.name, 'kilometer');
    expect(mm, same(Length().millimiter));
    expect(cm, same(Length().centimeter));
    expect(dm, same(Length().decimeter));
    expect(m, same(Length().meter));
    expect(km, same(Length().kilometer));
  });

  test('Length convertion factors', () {
    expect(Length().kilometer.quantityConverterTo(Length().centimeter)(1.0), 100000.0);
    expect(Length().kilometer.quantityConverterTo(Length().meter)(1.0), 1000.0);
    expect(Length().meter.quantityConverterTo(Length().decimeter)(1.0), 10.0);
    expect(Length().meter.quantityConverterTo(Length().meter)(1.0), 1.0);
    expect(Length().meter.quantityConverterTo(Length().centimeter)(1.0), 100.0);
    expect(Length().meter.quantityConverterTo(Length().millimiter)(1.0), 1000.0);
    expect(Length().decimeter.quantityConverterTo(Length().meter)(1.0), 0.1);
    expect(Length().decimeter.quantityConverterTo(Length().centimeter)(1.0), 10.0);
    expect(Length().centimeter.quantityConverterTo(Length().decimeter)(1.0), 0.1);
    expect(Length().centimeter.quantityConverterTo(Length().meter)(1.0), 0.01);
    expect(Length().millimiter.quantityConverterTo(Length().centimeter)(1.0), 0.1);
    expect(Length().millimiter.quantityConverterTo(Length().meter)(1.0), 0.001);
    expect(Length().foot.quantityConverterTo(Length().inch)(1.0), 12.0);
    expect(Length().inch.quantityConverterTo(Length().centimeter)(1.0), 2.54);
    expect(Length().mile.quantityConverterTo(Length().yard)(1.0), 1760.0);
    expect(Length().fathom.quantityConverterTo(Length().inch)(1.0), 72.0);
    expect(Length().fathom.quantityConverterTo(Length().meter)(1.0), closeToValue(1.8288));
    expect(Length().yard.quantityConverterTo(Length().foot)(1.0), 3.0);
    expect(Length().nauticalMile.quantityConverterTo(Length().meter)(1.0), 1852.0);
  });
}

Matcher closeToValue(double value) => inInclusiveRange(value - 0.000000001, value + 0.000000001);
