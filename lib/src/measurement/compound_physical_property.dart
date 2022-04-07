import 'compound_unit.dart';
import 'physical_property.dart';
import 'unit.dart';

abstract class CompoundPhysicalProperty<
    K extends CompoundPhysicalProperty<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends LinearConvertiblePhysicalProperty<K> {
  CompoundPhysicalProperty(this.a, this.b, {required String kind}) : super(kind: kind);

  final A a;
  final B b;

  @override
  CompoundUnit<K, A, B> get baseUnit => compoundUnit(
        a.baseUnit,
        b.baseUnit,
      );

  CompoundUnit<K, A, B> compoundUnit(LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
      {String? symbol, String? name});

  Pattern get compoundOperationSymbolPattern;
}

class MultipliedPhysicalProperties<
    K extends MultipliedPhysicalProperties<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends CompoundPhysicalProperty<K, A, B> {
  MultipliedPhysicalProperties(A a, B b, {required String kind}) : super(a, b, kind: kind);

  @override
  MultipliedUnits<K, A, B> compoundUnit(LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
          {String? symbol, String? name}) =>
      MultipliedUnits<K, A, B>(this as K, a, b, name: name, symbol: symbol);

  @override
  Pattern get compoundOperationSymbolPattern => RegExp('[.*]');
}

class DividedPhysicalProperties<
    K extends DividedPhysicalProperties<K, A, B>,
    A extends LinearConvertiblePhysicalProperty<A>,
    B extends LinearConvertiblePhysicalProperty<B>> extends CompoundPhysicalProperty<K, A, B> {
  DividedPhysicalProperties(A a, B b, {required String kind}) : super(a, b, kind: kind);

  @override
  DividedUnits<K, A, B> compoundUnit(LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
          {String? symbol, String? name}) =>
      DividedUnits<K, A, B>(this as K, a, b, name: name, symbol: symbol);

  @override
  Pattern get compoundOperationSymbolPattern => '/';
}
