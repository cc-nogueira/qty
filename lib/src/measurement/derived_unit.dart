import 'derived_physical_property.dart';
import 'derived_system_of_units.dart';
import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

abstract class DerivedUnit<K extends DerivedPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends Unit<K> {
  DerivedUnit(
    K kind,
    this.a,
    this.b,
    this.factor, {
    required String name,
    required String symbol,
  }) : super(DerivedSystemOfUnits<K, A, B>(kind), name: name, symbol: symbol);

  final Unit<A> a;
  final Unit<B> b;
  final double factor;

  @override
  QuantityConverter quantityConverterTo(covariant DerivedUnit<K, A, B> newUnit) {
    final cached = cachedConverter(newUnit);
    if (cached != null) {
      return cached;
    }

    final qcA = a.quantityConverterTo(newUnit.a);
    final qcB = b.quantityConverterTo(newUnit.b);

    final converter = derivedQuantityConverter(qcA, qcB);
    return cacheConverter(newUnit, converter);
  }

  QuantityConverter derivedQuantityConverter(QuantityConverter qcA, QuantityConverter qcB);
}

class MultipliedUnits<K extends DerivedPhysicalProperty<K, A, B>, A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedUnit<K, A, B> {
  MultipliedUnits(
    K kind,
    Unit<A> a,
    Unit<B> b,
    double factor, {
    String? name,
    String? symbol,
  }) : super(
          kind,
          a,
          b,
          factor,
          name: name ?? '${a.name} ${b.name}',
          symbol: symbol ?? '${a.symbol}.${b.symbol}',
        );

  @override
  QuantityConverter derivedQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => factor * value * qcA(1) * qcB(1);
}

class DividedUnits<K extends DerivedPhysicalProperty<K, A, B>, A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedUnit<K, A, B> {
  DividedUnits(
    K kind,
    Unit<A> a,
    Unit<B> b,
    double factor, {
    String? name,
    String? symbol,
  }) : super(
          kind,
          a,
          b,
          factor,
          name: name ?? '${a.name}s per ${b.name}',
          symbol: symbol ?? '${a.symbol}/${b.symbol}',
        );
  @override
  QuantityConverter derivedQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => factor * value * qcA(1) / qcB(1);
}
