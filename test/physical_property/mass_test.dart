import 'package:test/test.dart';
import 'package:qty/mass.dart';
import 'package:qty/volume.dart';

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
    final none = mass.unitWith(symbol: 'unknown');
    final g = mass.unitWith(symbol: 'g')!;
    final kg = mass.unitWith(symbol: 'kg')!;
    final mg = mass.unitWith(symbol: 'mg')!;
    final t = mass.unitWith(symbol: 't')!;
    final lb = mass.unitWith(symbol: 'lb')!;
    final oz = mass.unitWith(symbol: 'oz')!;
    final st = mass.unitWith(symbol: 'st')!;
    final qr = mass.unitWith(symbol: 'qr')!;
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
    expect(g, same(Mass.g));
    expect(kg, same(Mass.kg));
    expect(mg, same(Mass.mg));
    expect(t, same(Mass.t));
    expect(lb, same(Mass.lb));
    expect(oz, same(Mass.oz));
    expect(st, same(Mass.st));
    expect(qr, same(Mass.qr));
  });

  test('Mass convertion factors', () {
    expect(Mass.mg.quantityConverterTo(Mass.g)(1.0), 0.001);
    expect(Mass.mg.quantityConverterTo(Mass.kg)(1.0), 0.000001);
    expect(Mass.g.quantityConverterTo(Mass.kg)(1.0), 0.001);
    expect(Mass.g.quantityConverterTo(Mass.mg)(1.0), 1000.0);
    expect(Mass.kg.quantityConverterTo(Mass.g)(1.0), 1000.0);
    expect(Mass.kg.quantityConverterTo(Mass.mg)(1.0), 1000000.0);
    expect(Mass.lb.quantityConverterTo(Mass.oz)(1.0), 16.0);
    expect(Mass.lb.quantityConverterTo(Mass.kg)(1.0), 0.45359237);
    expect(Mass.lb.quantityConverterTo(Mass.g)(1.0), 453.59237);
    expect(Mass.lb.quantityConverterTo(Mass.g)(1.0), 453.59237);
    expect(Mass.oz.quantityConverterTo(Mass.lb)(1.0), 1.0 / 16.0);
    expect(Mass.st.quantityConverterTo(Mass.lb)(1.0), 14.0);
    expect(Mass.st.quantityConverterTo(Mass.g)(1.0), inInclusiveRange(6350.29318, 6350.293180000001));
    expect(Mass.st.quantityConverterTo(Mass.kg)(1.0), 6.35029318);
    expect(Mass.qr.quantityConverterTo(Mass.lb)(1.0), 28.0);
    expect(Mass.qr.quantityConverterTo(Mass.kg)(1.0), 12.70058636);
  });
}
