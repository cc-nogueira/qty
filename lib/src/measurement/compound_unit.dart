import 'compound_physical_property.dart';
import 'compound_system_of_units.dart';
import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

abstract class CompoundUnit<
    A extends LinearConvertiblePhysicalProperty,
    B extends LinearConvertiblePhysicalProperty,
    K extends CompoundPhysicalProperty<A, B>> extends LinearConvertibleUnit<K> {
  CompoundUnit(
    K kind,
    this.a,
    this.b, {
    required String name,
    required String symbol,
  }) : super(CompoundSystemOfUnits<A, B, K>(kind), name: name, symbol: symbol);

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
    K kind,
    LinearConvertibleUnit<A> a,
    LinearConvertibleUnit<B> b, {
    String? name,
    String? symbol,
  }) : super(
          kind,
          a,
          b,
          name: name ?? '${a.name} ${b.name}',
          symbol: symbol ?? '${a.symbol}.${b.symbol}',
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
  DividedUnits(
    K kind,
    LinearConvertibleUnit<A> a,
    LinearConvertibleUnit<B> b, {
    String? name,
    String? symbol,
  }) : super(
          kind,
          a,
          b,
          name: name ?? '${a.name}s per ${b.name}',
          symbol: symbol ?? '${a.symbol}/${b.symbol}',
        );
  @override
  QuantityConverter compoundQuantityConverter(
          QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => value * qcA(1) / qcB(1);
}
