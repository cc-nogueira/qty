import 'dart:math';

import 'derived_physical_property.dart';
import 'derived_system_of_units.dart';
import 'physical_property.dart';
import 'unit.dart';
import 'unit_converter.dart';

abstract class DerivedUnit<K extends DerivedPhysicalProperty<K>> extends Unit<K> {
  DerivedUnit(
    DerivedSystemOfUnits<K> systemOfUnits,
    this.factor, {
    required String name,
    required String symbol,
  }) : super(systemOfUnits, name: name, symbol: symbol);

  final double factor;
}

class PowersUnit<K extends PowersPhysicalProperty<K, A>, A extends PhysicalProperty<A>>
    extends DerivedUnit<K> {
  PowersUnit(
    PowersSystemOfUnits<K, A> systemOfUnits,
    this.a,
    double factor, {
    String? name,
    String? symbol,
  }) : super(systemOfUnits, factor,
            name: name ?? a.name + '^' + systemOfUnits.power.toString(),
            symbol: symbol ?? a.symbol + '^' + systemOfUnits.power.toString());

  final Unit<A> a;

  @override
  PowersSystemOfUnits<K, A> get systemOfUnits => super.systemOfUnits as PowersSystemOfUnits<K, A>;

  @override
  QuantityConverter quantityConverterTo(covariant PowersUnit<K, A> newUnit) {
    final cached = cachedConverter(newUnit);
    if (cached != null) {
      return cached;
    }

    final aUnitConverter = a.systemOfUnits.unitConverter;
    final newUnitConverter = newUnit.a.systemOfUnits.unitConverter;
    if (aUnitConverter == newUnitConverter && aUnitConverter is PowerOfTenUnitConverter) {
      final convertionFactor = (aUnitConverter as PowerOfTenUnitConverter<A>)
          .poweredConvertionFactor(fromUnit: a, toUnit: newUnit.a, power: systemOfUnits.power);
      return (double value) => factor / newUnit.factor * value * convertionFactor;
    }

    final qcA = a.quantityConverterTo(newUnit.a);
    final converter = powersQuantityConverter(qcA, newUnit.factor);
    return cacheConverter(newUnit, converter);
  }

  QuantityConverter powersQuantityConverter(QuantityConverter qcA, double newUnitFactor) {
    return (double value) => factor / newUnitFactor * value * pow(qcA(1), systemOfUnits.power);
  }
}

abstract class CompoundUnit<K extends CompoundPhysicalProperty<K, A, B>,
    A extends PhysicalProperty<A>, B extends PhysicalProperty<B>> extends DerivedUnit<K> {
  CompoundUnit(
    CompoundSystemOfUnits<K, A, B> systemOfUnits,
    this.a,
    this.b,
    double factor, {
    required String name,
    required String symbol,
  }) : super(systemOfUnits, factor, name: name, symbol: symbol);

  final Unit<A> a;
  final Unit<B> b;

  @override
  QuantityConverter quantityConverterTo(covariant CompoundUnit<K, A, B> newUnit) {
    final cached = cachedConverter(newUnit);
    if (cached != null) {
      return cached;
    }

    final qcA = a.quantityConverterTo(newUnit.a);
    final qcB = b.quantityConverterTo(newUnit.b);

    final converter = compoundQuantityConverter(qcA, qcB);
    return cacheConverter(newUnit, converter);
  }

  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB);
}

class MultipliedUnits<K extends CompoundPhysicalProperty<K, A, B>, A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundUnit<K, A, B> {
  MultipliedUnits(
    CompoundSystemOfUnits<K, A, B> systemOfUnits,
    Unit<A> a,
    Unit<B> b, {
    double factor = 1.0,
    String? name,
    String? symbol,
  }) : super(
          systemOfUnits,
          a,
          b,
          factor,
          name: name ?? '${a.name} ${b.name}',
          symbol: symbol ?? '${a.symbol}.${b.symbol}',
        );

  @override
  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => factor * value * qcA(1) * qcB(1);
}

class DividedUnits<K extends DividedPhysicalProperties<K, A, B>, A extends PhysicalProperty<A>,
    B extends PhysicalProperty<B>> extends CompoundUnit<K, A, B> {
  DividedUnits(
    DividedSystemOfUnits<K, A, B> systemOfUnits,
    Unit<A> a,
    Unit<B> b, {
    double factor = 1.0,
    String? name,
    String? symbol,
  }) : super(
          systemOfUnits,
          a,
          b,
          factor,
          name: name ?? '${a.name}s per ${b.name}',
          symbol: symbol ?? '${a.symbol}/${b.symbol}',
        );
  @override
  QuantityConverter compoundQuantityConverter(QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => factor * value * qcA(1) / qcB(1);
}
