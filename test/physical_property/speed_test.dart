// ignore_for_file: non_constant_identifier_names

import 'package:qty/speed.dart';
import 'package:qty/volume.dart';
import 'package:test/test.dart';

void main() {
  test('Speed singleton', () {
    final anUnitKind = Speed();
    final sameUnitKind = Speed();
    final anotherUnitKind = Volume();
    expect(anUnitKind, same(sameUnitKind));
    expect(identical(anUnitKind, anotherUnitKind), isFalse);
  });

  test('Speed units', () {
    final speed = Speed();
    final none = speed.unitWith(symbol: 'unknown');
    final m_s = speed.unitWith(symbol: 'm/s')!;
    final km_h = speed.unitWith(symbol: 'km/h')!;
    final cm_s = speed.unitWith(symbol: 'cm/s')!;
    final mi_h = speed.unitWith(symbol: 'mi/h')!;
    final kt = speed.unitWith(symbol: 'nm/h')!;
    expect(none, isNull);
    expect(m_s.symbol, 'm/s');
    expect(km_h.name, 'kilometers per hour');
    expect(cm_s.symbol, 'cm/s');
    expect(mi_h.name, 'miles per hour');
    expect(kt.symbol, 'nm/h');
    expect(m_s, same(Speed.m_s));
    expect(km_h, same(Speed.km_h));
    expect(mi_h, same(Speed.mi_h));
    expect(kt, same(Speed.kt));
  });

  test('Speed convertion factors', () {
    expect(Speed.m_s.quantityConverterTo(Speed.km_h)(1.0), 3.6);
    expect(Speed.km_h.quantityConverterTo(Speed.m_s)(1.0),
        closeToValue(0.277777777));
    expect(Speed.mi_h.quantityConverterTo(Speed.km_h)(1.0), 1.609344);
    expect(Speed.km_h.quantityConverterTo(Speed.mi_h)(1.0),
        closeToValue(0.621371192));
    expect(Speed.m_s.quantityConverterTo(Speed.kt)(1.0),
        closeToValue(1.943844492));
    expect(Speed.kt.quantityConverterTo(Speed.m_s)(1.0),
        closeToValue(0.514444444));
  });
}

Matcher closeToValue(double value) =>
    inInclusiveRange(value - 0.000000001, value + 0.000000001);
