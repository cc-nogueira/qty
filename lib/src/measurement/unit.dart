import 'package:equatable/equatable.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit_converter.dart';

abstract class UnitType extends Equatable {
  const UnitType();
  String get symbol;
  String get name;

  @override
  List<Object> get props => [symbol, name];
}

/// Unit of a physical property.
///
/// Expressed with a [symbol] in a [systemOfMeasurement] for its kind of [PhysicalProperty] (volume, mass, legnth, etc).
/// Provides access to a [QuantityConverter] to another [Unit] of the same kind of [PhysicalProperty].
class Unit extends UnitType {
  const Unit(this.systemOfMeasurent,
      {required this.name, required this.symbol});

  final SystemOfMeasurent systemOfMeasurent;

  @override
  final String symbol;

  @override
  final String name;

  PhysicalProperty get kind => systemOfMeasurent.kind;

  /// Compare if another unit is of the same kind
  bool sameKind(Unit unit) =>
      systemOfMeasurent.sameKind(unit.systemOfMeasurent);

  /// Compose a QuantityConverter function to convert amounts to another unit.
  QuantityConverter quantityConverterTo(Unit anotherUnit) {
    if (systemOfMeasurent == anotherUnit.systemOfMeasurent) {
      return systemOfMeasurent.quantityConverter(
          fromUnit: this, toUnit: anotherUnit);
    }
    final anotherFromBaseUnitConverter =
        anotherUnit.systemOfMeasurent.baseUnit.quantityConverterTo(anotherUnit);
    final thisToBaseConverter = quantityConverterTo(systemOfMeasurent.baseUnit);
    final baseToAnotherBaseConver =
        systemOfMeasurent.baseUnitConverterTo(anotherUnit.systemOfMeasurent);
    return (quantity) => anotherFromBaseUnitConverter(
        baseToAnotherBaseConver(thisToBaseConverter(quantity)));
  }

  @override
  List<Object> get props =>
      [systemOfMeasurent.kind, systemOfMeasurent.name, ...super.props];
}

class LinearConvertibleUnit extends Unit {
  const LinearConvertibleUnit(LinearConvertibleSystemOfUnits systemOfMeasurent,
      {required String name, required String symbol})
      : super(systemOfMeasurent, name: name, symbol: symbol);

  @override
  LinearConvertibleSystemOfUnits get systemOfMeasurent =>
      super.systemOfMeasurent as LinearConvertibleSystemOfUnits;
}
