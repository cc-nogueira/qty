import 'measurement.dart';
import 'systems_of_units.dart';

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

abstract class CompoundUnit extends LinearConvertibleUnit {
  const CompoundUnit(this.a, this.b,
      {required String name,
      required String symbol,
      required LinearConvertibleSystemOfUnits systemOfMeasurement})
      : super(systemOfMeasurement, name: name, symbol: symbol);

  final LinearConvertibleUnit a;
  final LinearConvertibleUnit b;

  @override
  QuantityConverter quantityConverterTo(covariant CompoundUnit anotherUnit) {
    final qcA = a.quantityConverterTo(anotherUnit.a);
    final qcB = b.quantityConverterTo(anotherUnit.b);

    return compoundQuantityConverter(qcA, qcB);
  }

  QuantityConverter compoundQuantityConverter(
      QuantityConverter qcA, QuantityConverter qcB);
}

class MultipliedUnits<A extends LinearConvertibleUnit,
    B extends LinearConvertibleUnit> extends CompoundUnit {
  MultipliedUnits(LinearConvertibleUnit a, LinearConvertibleUnit b)
      : super(
          a,
          b,
          name: '${a.name} ${b.name}',
          symbol: '${a.symbol}.${b.symbol}',
          systemOfMeasurement: LinearConvertibleSystemOfUnits(
            name: '${a.systemOfMeasurent.name} ${b.systemOfMeasurent.name}',
            kind: MultipliedPhysicalProperties(
              a.systemOfMeasurent.kind,
              b.systemOfMeasurent.kind,
              kind:
                  '${a.systemOfMeasurent.kind.kind}.${b.systemOfMeasurent.kind.kind}',
            ),
          ),
        );

  @override
  QuantityConverter compoundQuantityConverter(
          QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => qcA(value) * qcB(value);
}

class DividedUnits<A extends LinearConvertibleUnit,
    B extends LinearConvertibleUnit> extends CompoundUnit {
  DividedUnits(LinearConvertibleUnit a, LinearConvertibleUnit b)
      : super(
          a,
          b,
          name: '${a.name}s per ${b.name}',
          symbol: '${a.symbol}/${b.symbol}',
          systemOfMeasurement: LinearConvertibleSystemOfUnits(
            name: '${a.systemOfMeasurent.name} per ${b.systemOfMeasurent.name}',
            kind: DividedPhysicalProperties(
              a.systemOfMeasurent.kind,
              b.systemOfMeasurent.kind,
              kind: '${a.systemOfMeasurent.name}/${b.systemOfMeasurent.name}',
            ),
          ),
        );
  @override
  QuantityConverter compoundQuantityConverter(
          QuantityConverter qcA, QuantityConverter qcB) =>
      (double value) => value * qcA(1) / qcB(1);
}
