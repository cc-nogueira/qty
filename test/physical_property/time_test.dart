import 'package:qty/qty.dart';
import 'package:test/test.dart';

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
    final hr = time.unitWith(symbol: 'h')!;
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
    expect(hr.symbol, 'h');
    expect(hr.name, 'hour');
    expect(d.symbol, 'd');
    expect(d.name, 'day');
    expect(w.symbol, 'w');
    expect(w.name, 'week');
    expect(y.symbol, 'y');
    expect(y.name, 'year');
    expect(ms, same(Time().millisecond));
    expect(s, same(Time().second));
    expect(min, same(Time().minute));
    expect(hr, same(Time().hour));
    expect(d, same(Time().day));
    expect(w, same(Time().week));
    expect(y, same(Time().year));
  });

  test('Time convertion factors', () {
    expect(Time().millisecond.quantityConverterTo(Time().microsecond)(1.0), closeToValue(1000.0));
    expect(Time().millisecond.quantityConverterTo(Time().second)(1.0), 0.001);
    expect(Time().second.quantityConverterTo(Time().minute)(1.0), 1.0 / 60.0);
    expect(Time().second.quantityConverterTo(Time().hour)(1.0), 1.0 / 3600.0);
    expect(Time().second.quantityConverterTo(Time().day)(1.0), 1.0 / 3600.0 / 24.0);
    expect(Time().year.quantityConverterTo(Time().second)(1.0), 365.2425 * 24.0 * 3600.0);
    expect(Time().minute.quantityConverterTo(Time().second)(1.0), 60.0);
    expect(Time().minute.quantityConverterTo(Time().hour)(1.0), 1 / 60.0);
    expect(Time().hour.quantityConverterTo(Time().millisecond)(1.0), 3600000.0);
    expect(Time().hour.quantityConverterTo(Time().second)(1.0), 3600.0);
    expect(Time().hour.quantityConverterTo(Time().day)(1.0), 1.0 / 24.0);
    expect(Time().day.quantityConverterTo(Time().minute)(1.0), 24.0 * 60.0);
    expect(Time().day.quantityConverterTo(Time().hour)(1.0), 24.0);
    expect(Time().week.quantityConverterTo(Time().second)(1.0), 3600.0 * 24.0 * 7.0);
    expect(Time().week.quantityConverterTo(Time().day)(1.0), 7.0);
    expect(Time().week.quantityConverterTo(Time().hour)(1.0), 7.0 * 24.0);
    expect(Time().year.quantityConverterTo(Time().day)(1.0), 365.2425);
  });
}

Matcher closeToValue(double value) => inInclusiveRange(value - 0.000000001, value + 0.000000001);
