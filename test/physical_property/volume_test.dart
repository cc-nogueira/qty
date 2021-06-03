import 'package:test/test.dart';
import 'package:qty/mass.dart';
import 'package:qty/volume.dart';

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
    expect(l.name, 'litre');
    expect(cm3, same(Volume.cm3));
    expect(dm3, same(Volume.dm3));
    expect(m3, same(Volume.m3));
    expect(l, same(Volume.l));
  });

  test('Volume convertion factors', () {
    expect(Volume.l.quantityConverterTo(Volume.m3)(1.0), 0.001);
    expect(Volume.l.quantityConverterTo(Volume.cm3)(1.0), 1000.0);
    expect(Volume.m3.quantityConverterTo(Volume.dm3)(1.0), 1000.0);
    expect(Volume.m3.quantityConverterTo(Volume.l)(1.0), 1000.0);
    expect(Volume.m3.quantityConverterTo(Volume.cm3)(1.0), 1000000.0);
    expect(Volume.m3.quantityConverterTo(Volume.mm3)(1.0), 1000000000.0);
    expect(Volume.dm3.quantityConverterTo(Volume.m3)(1.0), 0.001);
    expect(Volume.dm3.quantityConverterTo(Volume.cm3)(1.0), 1000.0);
    expect(Volume.cm3.quantityConverterTo(Volume.dm3)(1.0), 0.001);
    expect(Volume.cm3.quantityConverterTo(Volume.l)(1.0), 0.001);
    expect(Volume.cm3.quantityConverterTo(Volume.m3)(1.0), 0.000001);
    expect(Volume.mm3.quantityConverterTo(Volume.cm3)(1.0), 0.001);
    expect(Volume.mm3.quantityConverterTo(Volume.l)(1.0), 0.000001);
    expect(Volume.gal.quantityConverterTo(Volume.pt)(1.0), 8.0);
    expect(Volume.gal.quantityConverterTo(Volume.flOz)(1.0), 160.0);
    expect(Volume.qt.quantityConverterTo(Volume.gal)(1.0), 1.0 / 4.0);
    expect(Volume.pt.quantityConverterTo(Volume.flOz)(1.0), 20.0);
    expect(Volume.gal.quantityConverterTo(Volume.mm3)(1.0), 4546090.0);
    expect(Volume.gal.quantityConverterTo(Volume.l)(1.0), 4.54609);
  });
}
