import 'compound_physical_property.dart';
import 'compound_unit.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';

class CompoundSystemOfUnits<K extends CompoundPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends SystemOfUnits<K> {
  CompoundSystemOfUnits(K kind) : super(name: 'Compound System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  CompoundUnit<K, A, B>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as CompoundUnit<K, A, B>?;

  Unit<K> defineNamedUnit({required String symbol, required String name, String? units}) {
    final parts = (units ?? symbol).split(kind.compoundOperationSymbolPattern);
    if (parts.length != 2) {
      throw ArgumentError('Illegal compound units in "${(units ?? symbol)}"');
    }
    final unitA = kind.a.unitWith(symbol: parts[0]);
    final unitB = kind.b.unitWith(symbol: parts[1]);
    if (unitA == null || unitB == null) {
      throw ArgumentError('Illegal compound units in "${(units ?? symbol)}"');
    }
    final unit = kind.compoundUnit(unitA, unitB, symbol: symbol, name: name);
    registerUnit(unit);
    return unit;
  }
}
