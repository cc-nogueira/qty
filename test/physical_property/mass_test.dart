import 'package:qty/qty.dart';
import 'package:test/test.dart';

void main() {
  test('Mass singleton', () {
    final anUnitKind = Mass();
    final sameUnitKind = Mass();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Mass units', () {
    final mass = Mass();
    final none = Mass().unitWith(symbol: 'unknown');
    final g = Mass().unitWith(symbol: 'g')!;
    final kg = Mass().unitWith(symbol: 'kg')!;
    final mg = Mass().unitWith(symbol: 'mg')!;
    final t = Mass().unitWith(symbol: 't')!;
    final lb = Mass().unitWith(symbol: 'lb')!;
    final oz = Mass().unitWith(symbol: 'oz')!;
    final st = Mass().unitWith(symbol: 'st')!;
    final qr = Mass().unitWith(symbol: 'qr')!;
    expect(none, isNull);
    expect(g.symbol, 'g');
    expect(g.name, 'gram');
    expect(kg.symbol, 'kg');
    expect(kg.name, 'kilogram');
    expect(mg.symbol, 'mg');
    expect(mg.name, 'milligram');
    expect(t.symbol, 't');
    expect(t.name, 'ton');
    expect(lb.symbol, 'lb');
    expect(lb.name, 'pound');
    expect(oz.symbol, 'oz');
    expect(oz.name, 'ounce');
    expect(st.symbol, 'st');
    expect(st.name, 'stone');
    expect(qr.symbol, 'qr');
    expect(qr.name, 'quarter');
    expect(g, same(Mass().gram));
    expect(kg, same(Mass().kilogram));
    expect(mg, same(Mass().milligram));
    expect(t, same(Mass().ton));
    expect(lb, same(Mass().pound));
    expect(oz, same(Mass().ounce));
    expect(st, same(Mass().stone));
    expect(qr, same(Mass().quarter));
  });

  test('Mass convertion factors', () {
    expect(Mass().milligram.quantityConverterTo(Mass().gram)(1.0), 0.001);
    expect(Mass().milligram.quantityConverterTo(Mass().kilogram)(1.0), 0.000001);
    expect(Mass().gram.quantityConverterTo(Mass().kilogram)(1.0), 0.001);
    expect(Mass().gram.quantityConverterTo(Mass().milligram)(1.0), 1000.0);
    expect(Mass().kilogram.quantityConverterTo(Mass().gram)(1.0), 1000.0);
    expect(Mass().kilogram.quantityConverterTo(Mass().milligram)(1.0), 1000000.0);
    expect(Mass().pound.quantityConverterTo(Mass().ounce)(1.0), 16.0);
    expect(Mass().pound.quantityConverterTo(Mass().kilogram)(1.0), 0.45359237);
    expect(Mass().pound.quantityConverterTo(Mass().gram)(1.0), 453.59237);
    expect(Mass().pound.quantityConverterTo(Mass().gram)(1.0), 453.59237);
    expect(Mass().ounce.quantityConverterTo(Mass().pound)(1.0), 1.0 / 16.0);
    expect(Mass().stone.quantityConverterTo(Mass().pound)(1.0), 14.0);
    expect(Mass().stone.quantityConverterTo(Mass().gram)(1.0), closeToValue(6350.29318));
    expect(Mass().stone.quantityConverterTo(Mass().kilogram)(1.0), 6.35029318);
    expect(Mass().quarter.quantityConverterTo(Mass().pound)(1.0), 28.0);
    expect(Mass().quarter.quantityConverterTo(Mass().kilogram)(1.0), 12.70058636);
  });
}

Matcher closeToValue(double value) => inInclusiveRange(value - 0.000000001, value + 0.000000001);
