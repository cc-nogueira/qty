import 'derived_physical_property.dart';
import 'derived_unit.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';

abstract class DerivedSystemOfUnits<K extends DerivedPhysicalProperty<K>> extends SystemOfUnits<K> {
  DerivedSystemOfUnits({required K kind, required String name}) : super(name: name, kind: kind);
}

class PowersSystemOfUnits<K extends PowersPhysicalProperty<K, A>, A extends PhysicalProperty<A>>
    extends DerivedSystemOfUnits<K> {
  PowersSystemOfUnits(K kind, {required this.power})
      : super(name: 'Powers System of Units', kind: kind);

  final int power;

  Unit<K> definePowersUnit({
    required String symbol,
    required String name,
    double factor = 1.0,
    String? baseUnit,
  }) {
    String term = baseUnit ?? symbol;
    if (symbol.endsWith('²') || symbol.endsWith('³')) {
      term = term.substring(0, term.length - 1);
    }

    final unit = kind.a.unitWith(symbol: term);
    if (unit == null) {
      throw ArgumentError('Illegal power of units with "$term"');
    }
    final powersUnit = kind.powersUnit(unit, power, factor, symbol: symbol, name: name);
    registerUnit(powersUnit);
    return powersUnit;
  }
}

class CompoundSystemOfUnits<K extends CompoundPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends DerivedSystemOfUnits<K> {
  CompoundSystemOfUnits(K kind) : super(name: 'Compound System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  CompoundUnit<K, A, B>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as CompoundUnit<K, A, B>?;

  Unit<K> defineCompoundUnit({
    required String symbol,
    required String name,
    double factor = 1.0,
    String? units,
  }) {
    List<String> parts = (units ?? symbol).split(kind.compoundSymbolPattern);
    if (parts.length != 2) {
      final term = (units ?? symbol);
      if (term.length > 1 && term.endsWith('²')) {
        final each = term.substring(0, symbol.length - 1);
        parts = [each, each];
      }
      throw ArgumentError('Illegal compound of units in "${(units ?? symbol)}"');
    }
    final unitA = kind.a.unitWith(symbol: parts[0]);
    final unitB = kind.b.unitWith(symbol: parts[1]);
    if (unitA == null || unitB == null) {
      throw ArgumentError('Illegal compound of units in "${(units ?? symbol)}"');
    }
    final unit = kind.compoundUnit(unitA, unitB, factor, symbol: symbol, name: name);
    registerUnit(unit);
    return unit;
  }
}
