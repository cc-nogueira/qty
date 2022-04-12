import 'derived_system_of_units.dart';
import 'derived_unit.dart';
import 'physical_property.dart';
import 'unit.dart';

abstract class DerivedPhysicalProperty<K extends DerivedPhysicalProperty<K>>
    extends PhysicalProperty<K> {
  DerivedPhysicalProperty({
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(kind: kind, dimensionSymbol: dimensionSymbol, quantitySymbol: quantitySymbol);
}

abstract class PowersPhysicalProperty<K extends PowersPhysicalProperty<K, A>,
    A extends PhysicalProperty<A>> extends DerivedPhysicalProperty<K> {
  PowersPhysicalProperty(
    this.a,
    this.power, {
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(kind: kind, dimensionSymbol: dimensionSymbol, quantitySymbol: quantitySymbol);

  final A a;
  final int power;

  @override
  PowersUnit<K, A> get baseUnit => powersUnit(a.baseUnit, power, 1.0);

  PowersUnit<K, A> powersUnit(Unit<A> a, int power, double factor,
          {String? symbol, String? name}) =>
      PowersUnit<K, A>(
        PowersSystemOfUnits<K, A>(this as K, power: power),
        a,
        factor,
        name: name,
        symbol: symbol,
      );
}

abstract class CompoundPhysicalProperty<
    K extends CompoundPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends DerivedPhysicalProperty<K> {
  CompoundPhysicalProperty(
    this.a,
    this.b, {
    required String kind,
    required String dimensionSymbol,
    required String quantitySymbol,
  }) : super(kind: kind, dimensionSymbol: dimensionSymbol, quantitySymbol: quantitySymbol);

  final A a;
  final B b;

  @override
  CompoundUnit<K, A, B> get baseUnit => compoundUnit(a.baseUnit, b.baseUnit, 1.0);

  CompoundUnit<K, A, B> compoundUnit(Unit<A> a, Unit<B> b, double factor,
      {String? symbol, String? name});

  Pattern get compoundSymbolPattern;
}

abstract class MultipliedPhysicalProperties<
    K extends MultipliedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundPhysicalProperty<K, A, B> {
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
  MultipliedUnits<K, A, B> compoundUnit(Unit<A> a, Unit<B> b, double factor,
          {String? symbol, String? name}) =>
      MultipliedUnits<K, A, B>(
        this as K,
        a,
        b,
        factor,
        symbol: symbol,
        name: name,
      );

  @override
  Pattern get compoundSymbolPattern => RegExp('[.*]');
}

abstract class DividedPhysicalProperties<
    K extends DividedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundPhysicalProperty<K, A, B> {
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
  DividedUnits<K, A, B> compoundUnit(Unit<A> a, Unit<B> b, double factor,
          {String? symbol, String? name}) =>
      DividedUnits<K, A, B>(
        this as K,
        a,
        b,
        factor,
        symbol: symbol,
        name: name,
      );

  @override
  Pattern get compoundSymbolPattern => '/';
}
