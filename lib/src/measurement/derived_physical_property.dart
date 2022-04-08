import 'derived_unit.dart';
import 'physical_property.dart';
import 'unit.dart';

abstract class DerivedPhysicalProperty<K extends DerivedPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends PhysicalProperty<K> {
  DerivedPhysicalProperty(this.a, this.b, {required String kind}) : super(kind: kind);

  final A a;
  final B b;

  @override
  DerivedUnit<K, A, B> get baseUnit => deriveUnit(
        a.baseUnit,
        b.baseUnit,
      );

  DerivedUnit<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, {String? symbol, String? name});

  Pattern get derivationSymbolPattern;
}

abstract class MultipliedPhysicalProperties<
    K extends MultipliedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedPhysicalProperty<K, A, B> {
  MultipliedPhysicalProperties(A a, B b, {required String kind}) : super(a, b, kind: kind);

  @override
  MultipliedUnits<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, {String? symbol, String? name}) =>
      MultipliedUnits<K, A, B>(this as K, a, b, name: name, symbol: symbol);

  @override
  Pattern get derivationSymbolPattern => RegExp('[.*]');
}

abstract class DividedPhysicalProperties<
    K extends DividedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedPhysicalProperty<K, A, B> {
  DividedPhysicalProperties(A a, B b, {required String kind}) : super(a, b, kind: kind);

  @override
  DividedUnits<K, A, B> deriveUnit(Unit<A> a, Unit<B> b, {String? symbol, String? name}) =>
      DividedUnits<K, A, B>(this as K, a, b, name: name, symbol: symbol);

  @override
  Pattern get derivationSymbolPattern => '/';
}
