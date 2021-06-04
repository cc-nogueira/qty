import 'package:test/test.dart';
import 'package:qty/src/physical_property/time.dart';
import 'package:qty/src/physical_property/volume.dart';

void main() {
  test('Length singleton', () {
    final anUnitKind = Time();
    final sameUnitKind = Time();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Time units', () {
    final time = Time();
    final none = time.unitWith(symbol: 'unknown');
    final ms = time.unitWith(symbol: 'ms')!;
    final s = time.unitWith(symbol: 's')!;
    final min = time.unitWith(symbol: 'min')!;
    final hr = time.unitWith(symbol: 'hr')!;
    final d = time.unitWith(symbol: 'd')!;
    final w = time.unitWith(symbol: 'w')!;
    final y = time.unitWith(symbol: 'y')!;
    expect(none, isNull);
    expect(ms.symbol, 'ms');
    expect(ms.name, 'millisecond');
    expect(s.symbol, 's');
    expect(s.name, 'second');
    expect(min.symbol, 'min');
    expect(min.name, 'minute');
    expect(hr.symbol, 'hr');
    expect(hr.name, 'hour');
    expect(d.symbol, 'd');
    expect(d.name, 'day');
    expect(w.symbol, 'w');
    expect(w.name, 'week');
    expect(y.symbol, 'y');
    expect(y.name, 'Julian year');
    expect(ms, same(Time.ms));
    expect(s, same(Time.s));
    expect(min, same(Time.min));
    expect(hr, same(Time.hr));
    expect(d, same(Time.d));
    expect(w, same(Time.w));
    expect(y, same(Time.y));
  });

  test('Length convertion factors', () {
    expect(Time.ms.quantityConverterTo(Time.us)(1.0),
        inInclusiveRange(1000.0, 1000.0000000000001));
    expect(Time.ms.quantityConverterTo(Time.s)(1.0), 0.001);
    expect(Time.s.quantityConverterTo(Time.min)(1.0), 1.0 / 60.0);
    expect(Time.s.quantityConverterTo(Time.hr)(1.0), 1.0 / 3600.0);
    expect(Time.s.quantityConverterTo(Time.d)(1.0), 1.0 / 3600.0 / 24.0);
    expect(Time.y.quantityConverterTo(Time.s)(1.0), 365.25 * 24.0 * 3600.0);
    expect(Time.min.quantityConverterTo(Time.s)(1.0), 60.0);
    expect(Time.min.quantityConverterTo(Time.hr)(1.0), 1 / 60.0);
    expect(Time.hr.quantityConverterTo(Time.ms)(1.0), 3600000.0);
    expect(Time.hr.quantityConverterTo(Time.s)(1.0), 3600.0);
    expect(Time.hr.quantityConverterTo(Time.d)(1.0), 1.0 / 24.0);
    expect(Time.d.quantityConverterTo(Time.min)(1.0), 24.0 * 60.0);
    expect(Time.d.quantityConverterTo(Time.hr)(1.0), 24.0);
    expect(Time.w.quantityConverterTo(Time.s)(1.0), 3600.0 * 24.0 * 7.0);
    expect(Time.w.quantityConverterTo(Time.d)(1.0), 7.0);
    expect(Time.w.quantityConverterTo(Time.hr)(1.0), 7.0 * 24.0);
    expect(Time.y.quantityConverterTo(Time.d)(1.0), 365.25);
  });
}
