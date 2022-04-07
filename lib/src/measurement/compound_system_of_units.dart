import 'compound_physical_property.dart';
import 'compound_unit.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';

class CompoundSystemOfUnits<
        A extends LinearConvertiblePhysicalProperty,
        B extends LinearConvertiblePhysicalProperty,
        K extends CompoundPhysicalProperty<A, B>>
    extends LinearConvertibleSystemOfUnits<K> {
  CompoundSystemOfUnits(K kind)
      : super(name: 'Compound System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  CompoundUnit<A, B, K>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as CompoundUnit<A, B, K>?;

  Unit<K> defineNamedUnit(
      {required String symbol, required String name, String? units}) {
    final parts = (units ?? symbol).split(kind.compoundOperationSymbolPattern);
    if (parts.length != 2) {
      throw ArgumentError('Illegal compound units in "${(units ?? symbol)}"');
    }
    final unitA =
        kind.a.unitWith(symbol: parts[0]) as LinearConvertibleUnit<A>?;
    final unitB =
        kind.b.unitWith(symbol: parts[1]) as LinearConvertibleUnit<B>?;
    if (unitA == null || unitB == null) {
      throw ArgumentError('Illegal compound units in "${(units ?? symbol)}"');
    }
    final unit = kind.compoundUnit(unitA, unitB, symbol: symbol, name: name)
        as CompoundUnit<A, B, K>;
    registerUnit(unit);
    return unit;
  }
}
