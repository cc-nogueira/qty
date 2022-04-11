import 'derived_unit.dart';
import 'physical_property.dart';
import 'unit.dart';

abstract class DerivedPhysicalProperty<K extends DerivedPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends PhysicalProperty<K> {
  DerivedPhysicalProperty(
    this.a,
    this.b, {
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(kind: kind, dimensionSymbol: dimensionSymbol, quantitySymbol: quantitySymbol);

  final A a;
  final B b;

  @override
  DerivedUnit<K, A, B> get baseUnit => deriveUnit(a.baseUnit, b.baseUnit, 1.0);

  DerivedUnit<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, double factor,
      {String? symbol, String? name});

  Pattern get derivationSymbolPattern;
}

abstract class MultipliedPhysicalProperties<
    K extends MultipliedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedPhysicalProperty<K, A, B> {
  MultipliedPhysicalProperties(
    A a,
    B b, {
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(
          a,
          b,
          kind: kind,
          dimensionSymbol: dimensionSymbol,
          quantitySymbol: quantitySymbol,
        );

  @override
  MultipliedUnits<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, double factor,
          {String? symbol, String? name}) =>
      MultipliedUnits<K, A, B>(
        this as K,
        a,
        b,
        factor,
        name: name,
        symbol: symbol,
      );

  @override
  Pattern get derivationSymbolPattern => RegExp('[.*]');
}

abstract class DividedPhysicalProperties<
    K extends DividedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedPhysicalProperty<K, A, B> {
  DividedPhysicalProperties(
    A a,
    B b, {
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(
          a,
          b,
          kind: kind,
          dimensionSymbol: dimensionSymbol,
          quantitySymbol: quantitySymbol,
        );

  @override
  DividedUnits<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, double factor,
          {String? symbol, String? name}) =>
      DividedUnits<K, A, B>(
        this as K,
        a,
        b,
        factor,
        name: name,
        symbol: symbol,
      );

  @override
  Pattern get derivationSymbolPattern => '/';
}
