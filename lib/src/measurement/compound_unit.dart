import 'compound_physical_property.dart';
import 'compound_system_of_units.dart';
import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

abstract class CompoundUnit<
    K extends CompoundPhysicalProperty<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends LinearConvertibleUnit<K> {
  CompoundUnit(
    K kind,
    this.a,
    this.b, {
    required String name,
    required String symbol,
  }) : super(CompoundSystemOfUnits<K, A, B>(kind), name: name, symbol: symbol);

  final LinearConvertibleUnit<A> a;
  final LinearConvertibleUnit<B> b;

  @override
  QuantityConverter quantityConverterTo(covariant CompoundUnit<K, A, B> anotherUnit) {
    final qcA = a.quantityConverterTo(anotherUnit.a);
    final qcB = b.quantityConverterTo(anotherUnit.b);

    return compoundQuantityConverter(qcA, qcB);
  }

  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB);
}

class MultipliedUnits<
    K extends CompoundPhysicalProperty<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends CompoundUnit<K, A, B> {
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
  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => qcA(value) * qcB(value);
}

class DividedUnits<
    K extends CompoundPhysicalProperty<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends CompoundUnit<K, A, B> {
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
  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => value * qcA(1) / qcB(1);
}
