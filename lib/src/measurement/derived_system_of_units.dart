import 'derived_physical_property.dart';
import 'derived_unit.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';

class DerivedSystemOfUnits<K extends DerivedPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends SystemOfUnits<K> {
  DerivedSystemOfUnits(K kind) : super(name: 'Derived System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  DerivedUnit<K, A, B>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as DerivedUnit<K, A, B>?;

  Unit<K> defineNamedUnit({required String symbol, required String name, String? units}) {
    final parts = (units ?? symbol).split(kind.derivationSymbolPattern);
    if (parts.length != 2) {
      throw ArgumentError('Illegal derivation of units in "${(units ?? symbol)}"');
    }
    final unitA = kind.a.unitWith(symbol: parts[0]);
    final unitB = kind.b.unitWith(symbol: parts[1]);
    if (unitA == null || unitB == null) {
      throw ArgumentError('Illegal derivation of units in "${(units ?? symbol)}"');
    }
    final unit = kind.deriveUnit(unitA, unitB, symbol: symbol, name: name);
    registerUnit(unit);
    return unit;
  }
}