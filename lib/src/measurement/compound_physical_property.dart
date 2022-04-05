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

  @override
  LinearConvertibleUnit get baseUnit => compoundUnit(a.baseUnit, b.baseUnit);

  /// Finds an unit with a symbol in my SystemOfMeasurement list
  @override
  LinearConvertibleUnit? unitWith({required String symbol}) {
    final cached = unitsCash[symbol];
    if (cached != null) {
      return cached;
    }
    final parts = symbol.split(compoundOperationSymbolPattern);
    if (parts.length != 2) {
      return null;
    }
    final unitA = a.unitWith(symbol: parts[0]);
    final unitB = b.unitWith(symbol: parts[1]);
    if (unitA == null || unitB == null) {
      return null;
    }
    final unit = compoundUnit(unitA, unitB);
    unitsCash[symbol] = unit;
    return unit;
  }

  final unitsCash = <String, LinearConvertibleUnit>{};

  CompoundUnit compoundUnit(LinearConvertibleUnit a, LinearConvertibleUnit b);
  Pattern get compoundOperationSymbolPattern;
}

class MultipliedPhysicalProperties<A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty>
    extends CompoundPhysicalProperty<A, B> {
  MultipliedPhysicalProperties(A a, B b, {required String kind})
      : super(a, b, kind: kind);

  @override
  CompoundUnit compoundUnit(LinearConvertibleUnit a, LinearConvertibleUnit b) =>
      MultipliedUnits(a, b);

  @override
  Pattern get compoundOperationSymbolPattern => RegExp('[.*]');
}

class DividedPhysicalProperties<A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty>
    extends CompoundPhysicalProperty<A, B> {
  DividedPhysicalProperties(A a, B b, {required String kind})
      : super(a, b, kind: kind);

  @override
  CompoundUnit compoundUnit(LinearConvertibleUnit a, LinearConvertibleUnit b) =>
      DividedUnits(a, b);

  @override
  Pattern get compoundOperationSymbolPattern => '/';
}
