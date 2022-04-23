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

  Unit<K> definePowersUnit(
      {required Unit<A> unit, required String name, required String symbol, double factor = 1.0}) {
    final powersUnit = kind.powersUnit(unit, power, factor, symbol: symbol, name: name);
    registerUnit(powersUnit);
    return powersUnit;
  }
}

class CompoundSystemOfUnits<K extends CompoundPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends DerivedSystemOfUnits<K> {
  CompoundSystemOfUnits({required String name, required K kind}) : super(name: name, kind: kind);
}

class MultipliedSystemOfUnits<
    K extends MultipliedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundSystemOfUnits<K, A, B> {
  MultipliedSystemOfUnits(K kind) : super(name: 'Multiplied System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  CompoundUnit<K, A, B>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as MultipliedUnits<K, A, B>?;

  Unit<K> defineCompoundUnit(Unit<A> unitA, Unit<B> unitB,
      {double factor = 1.0, String? name, String? symbol}) {
    final unit = MultipliedUnits(this, unitA, unitB, factor: factor, name: name, symbol: symbol);
    registerUnit(unit);
    return unit;
  }
}

class DividedSystemOfUnits<
    K extends DividedPhysicalProperties<K, A, B>,
    A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundSystemOfUnits<K, A, B> {
  DividedSystemOfUnits(K kind) : super(name: 'Divided System of Units', kind: kind);

  /// Finds an unit by its symbol. Retuns null if none is found
  @override
  CompoundUnit<K, A, B>? unitWith({required String symbol}) =>
      super.unitWith(symbol: symbol) as DividedUnits<K, A, B>?;

  Unit<K> defineCompoundUnit(Unit<A> unitA, Unit<B> unitB,
      {double factor = 1.0, String? name, String? symbol}) {
    final unit = DividedUnits(this, unitA, unitB, factor: factor, name: name, symbol: symbol);
    registerUnit(unit);
    return unit;
  }
}
