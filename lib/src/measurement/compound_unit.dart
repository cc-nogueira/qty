import 'compound_physical_property.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';
import 'unit_converter.dart';

abstract class CompoundUnit<
    A extends LinearConvertiblePhysicalProperty,
    B extends LinearConvertiblePhysicalProperty,
    K extends CompoundPhysicalProperty<A, B>> extends LinearConvertibleUnit<K> {
  const CompoundUnit(
    this.a,
    this.b, {
    required String name,
    required String symbol,
    required LinearConvertibleSystemOfUnits<K> systemOfMeasurement,
  }) : super(systemOfMeasurement, name: name, symbol: symbol);

  final LinearConvertibleUnit<A> a;
  final LinearConvertibleUnit<B> b;

  @override
  QuantityConverter quantityConverterTo(
      covariant CompoundUnit<A, B, K> anotherUnit) {
    final qcA = a.quantityConverterTo(anotherUnit.a);
    final qcB = b.quantityConverterTo(anotherUnit.b);

    return compoundQuantityConverter(qcA, qcB);
  }

  QuantityConverter compoundQuantityConverter(
      QuantityConverter qcA, QuantityConverter qcB);
}

class MultipliedUnits<
    A extends LinearConvertiblePhysicalProperty,
    B extends LinearConvertiblePhysicalProperty,
    K extends CompoundPhysicalProperty<A, B>> extends CompoundUnit<A, B, K> {
  MultipliedUnits(
      K kind, LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b)
      : super(
          a,
          b,
          name: '${a.name} ${b.name}',
          symbol: '${a.symbol}.${b.symbol}',
          systemOfMeasurement: LinearConvertibleSystemOfUnits<K>(
            name: '${a.systemOfMeasurent.name} ${b.systemOfMeasurent.name}',
            kind: kind,
          ),
        );

  @override
  QuantityConverter compoundQuantityConverter(
          QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => qcA(value) * qcB(value);
}

class DividedUnits<
    A extends LinearConvertiblePhysicalProperty,
    B extends LinearConvertiblePhysicalProperty,
    K extends CompoundPhysicalProperty<A, B>> extends CompoundUnit<A, B, K> {
  DividedUnits(K kind, LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b)
      : super(
          a,
          b,
          name: '${a.name}s per ${b.name}',
          symbol: '${a.symbol}/${b.symbol}',
          systemOfMeasurement: LinearConvertibleSystemOfUnits<K>(
            name: '${a.systemOfMeasurent.name} per ${b.systemOfMeasurent.name}',
            kind: kind,
          ),
        );
  @override
  QuantityConverter compoundQuantityConverter(
          QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => value * qcA(1) / qcB(1);
}
