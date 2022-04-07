import 'compound_unit.dart';
import 'physical_property.dart';
import 'unit.dart';

abstract class CompoundPhysicalProperty<
        A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty>
    extends LinearConvertiblePhysicalProperty {
  CompoundPhysicalProperty(this.a, this.b, {required String kind})
      : super(kind: kind);

  final A a;
  final B b;
  final unitsCash =
      <String, CompoundUnit<A, B, CompoundPhysicalProperty<A, B>>>{};

  @override
  CompoundUnit<A, B, CompoundPhysicalProperty<A, B>> get baseUnit =>
      compoundUnit(
        a.baseUnit as LinearConvertibleUnit<A>,
        b.baseUnit as LinearConvertibleUnit<B>,
      );

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  // @override
  // CompoundUnit<A, B, CompoundPhysicalProperty<A, B>>? unitWith(
  //     {required String symbol}) {
  //   final cached = unitsCash[symbol];
  //   if (cached != null) {
  //     return cached;
  //   }
  //   final parts = symbol.split(compoundOperationSymbolPattern);
  //   if (parts.length != 2) {
  //     return null;
  //   }
  //   final unitA = a.unitWith(symbol: parts[0]) as LinearConvertibleUnit<A>?;
  //   final unitB = b.unitWith(symbol: parts[1]) as LinearConvertibleUnit<B>?;
  //   if (unitA == null || unitB == null) {
  //     return null;
  //   }
  //   final unit = compoundUnit(unitA, unitB);
  //   unitsCash[symbol] = unit;
  //   return unit;
  // }

  CompoundUnit<A, B, CompoundPhysicalProperty<A, B>> compoundUnit(
      LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
      {String? symbol, String? name});

  Pattern get compoundOperationSymbolPattern;
}

class MultipliedPhysicalProperties<A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty>
    extends CompoundPhysicalProperty<A, B> {
  MultipliedPhysicalProperties(A a, B b, {required String kind})
      : super(a, b, kind: kind);

  @override
  MultipliedUnits<A, B, MultipliedPhysicalProperties<A, B>> compoundUnit(
          LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
          {String? symbol, String? name}) =>
      MultipliedUnits<A, B, MultipliedPhysicalProperties<A, B>>(this, a, b,
          name: name, symbol: symbol);

  @override
  Pattern get compoundOperationSymbolPattern => RegExp('[.*]');
}

class DividedPhysicalProperties<A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty>
    extends CompoundPhysicalProperty<A, B> {
  DividedPhysicalProperties(A a, B b, {required String kind})
      : super(a, b, kind: kind);

  @override
  DividedUnits<A, B, DividedPhysicalProperties<A, B>> compoundUnit(
          LinearConvertibleUnit<A> a, LinearConvertibleUnit<B> b,
          {String? symbol, String? name}) =>
      DividedUnits<A, B, DividedPhysicalProperties<A, B>>(this, a, b,
          name: name, symbol: symbol);

  @override
  Pattern get compoundOperationSymbolPattern => '/';
}
