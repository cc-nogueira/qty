import 'compound_physical_property.dart';
import 'systems_of_units.dart';
import 'unit.dart';
import 'unit_converter.dart';

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
