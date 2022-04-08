// ignore_for_file: non_constant_identifier_names
import 'package:qty/qty.dart';
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
    final kt = speed.unitWith(symbol: 'kt')!;
    expect(none, isNull);
    expect(m_s.symbol, 'm/s');
    expect(km_h.name, 'kilometers per hour');
    expect(cm_s.symbol, 'cm/s');
    expect(mi_h.name, 'miles per hour');
    expect(kt.symbol, 'kt');
    expect(m_s, same(Speed().meterPerSecond));
    expect(km_h, same(Speed().kilometerPerHour));
    expect(mi_h, same(Speed().milePerHour));
    expect(kt, same(Speed().knot));
  });

  test('Speed convertion factors', () {
    expect(Speed().meterPerSecond.quantityConverterTo(Speed().kilometerPerHour)(1.0), 3.6);
    expect(Speed().kilometerPerHour.quantityConverterTo(Speed().meterPerSecond)(1.0),
        closeToValue(0.277777777));
    expect(Speed().milePerHour.quantityConverterTo(Speed().kilometerPerHour)(1.0), 1.609344);
    expect(Speed().kilometerPerHour.quantityConverterTo(Speed().milePerHour)(1.0),
        closeToValue(0.621371192));
    expect(
        Speed().meterPerSecond.quantityConverterTo(Speed().knot)(1.0), closeToValue(1.943844492));
    expect(
        Speed().knot.quantityConverterTo(Speed().meterPerSecond)(1.0), closeToValue(0.514444444));
  });

  test('Compound unit kind test', () {
    expect(Speed().knot.kind, same(Speed()));
    expect(Speed().milePerHour.kind, same(Speed()));
    expect(Speed().kilometerPerHour.kind, same(Speed()));
  });
}

Matcher closeToValue(double value) => inInclusiveRange(value - 0.000000001, value + 0.000000001);
