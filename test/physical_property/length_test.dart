import 'package:test/test.dart';
import 'package:qty/src/physical_property/length.dart';
import 'package:qty/src/physical_property/volume.dart';

void main() {
  test('Length singleton', () {
    final anUnitKind = Length();
    final sameUnitKind = Length();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Length units', () {
    final length = Length();
    final none = length.unitWith(symbol: 'unknown');
    final mm = length.unitWith(symbol: 'mm')!;
    final cm = length.unitWith(symbol: 'cm')!;
    final dm = length.unitWith(symbol: 'dm')!;
    final m = length.unitWith(symbol: 'm')!;
    final km = length.unitWith(symbol: 'km')!;
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
    expect(mm, same(Length.mm));
    expect(cm, same(Length.cm));
    expect(dm, same(Length.dm));
    expect(m, same(Length.m));
    expect(km, same(Length.km));
  });

  test('Length convertion factors', () {
    expect(Length.km.quantityConverterTo(Length.cm)(1.0), 100000.0);
    expect(Length.km.quantityConverterTo(Length.m)(1.0), 1000.0);
    expect(Length.m.quantityConverterTo(Length.dm)(1.0), 10.0);
    expect(Length.m.quantityConverterTo(Length.m)(1.0), 1.0);
    expect(Length.m.quantityConverterTo(Length.cm)(1.0), 100.0);
    expect(Length.m.quantityConverterTo(Length.mm)(1.0), 1000.0);
    expect(Length.dm.quantityConverterTo(Length.m)(1.0), 0.1);
    expect(Length.dm.quantityConverterTo(Length.cm)(1.0), 10.0);
    expect(Length.cm.quantityConverterTo(Length.dm)(1.0), 0.1);
    expect(Length.cm.quantityConverterTo(Length.m)(1.0), 0.01);
    expect(Length.mm.quantityConverterTo(Length.cm)(1.0), 0.1);
    expect(Length.mm.quantityConverterTo(Length.m)(1.0), 0.001);
    expect(Length.ft.quantityConverterTo(Length.inch)(1.0), 12.0);
    expect(Length.inch.quantityConverterTo(Length.cm)(1.0), 2.54);
    expect(Length.mi.quantityConverterTo(Length.yd)(1.0), 1760.0);
    expect(Length.fa.quantityConverterTo(Length.inch)(1.0), 72.0);
    expect(Length.fa.quantityConverterTo(Length.m)(1.0), inInclusiveRange(1.8288, 1.8288000000000001));
    expect(Length.yd.quantityConverterTo(Length.ft)(1.0), 3.0);
    expect(Length.nm.quantityConverterTo(Length.m)(1.0), 1852.0);
  });
}
