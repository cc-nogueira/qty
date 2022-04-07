import 'package:equatable/equatable.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit_converter.dart';

/// Unit of a physical property.
///
/// Expressed with a [symbol] in a [systemOfMeasurement] for its kind of [PhysicalProperty] (volume, mass, legnth, etc).
/// Provides access to a [QuantityConverter] to another [Unit] of the same kind of [PhysicalProperty].
class Unit<K extends Kind> extends Equatable {
  const Unit(this.systemOfMeasurent, {required this.name, required this.symbol});

  final SystemOfMeasurement<K> systemOfMeasurent;
  final String symbol;
  final String name;

  Kind get kind => systemOfMeasurent.kind;

  /// Compare if another unit is of the same kind
  bool sameKind(Unit unit) => systemOfMeasurent.sameKind(unit.systemOfMeasurent);

  /// Compose a QuantityConverter function to convert amounts to another unit.
  QuantityConverter quantityConverterTo(Unit<K> anotherUnit) {
    if (systemOfMeasurent == anotherUnit.systemOfMeasurent) {
      return systemOfMeasurent.quantityConverter(fromUnit: this, toUnit: anotherUnit);
    }
    final anotherFromBaseUnitConverter =
        anotherUnit.systemOfMeasurent.baseUnit.quantityConverterTo(anotherUnit);
    final thisToBaseConverter = quantityConverterTo(systemOfMeasurent.baseUnit);
    final baseToAnotherBaseConver =
        systemOfMeasurent.baseUnitConverterTo(anotherUnit.systemOfMeasurent);
    return (quantity) =>
        anotherFromBaseUnitConverter(baseToAnotherBaseConver(thisToBaseConverter(quantity)));
  }

  @override
  List<Object> get props => [systemOfMeasurent.kind, systemOfMeasurent.name, symbol, name];
}

class LinearConvertibleUnit<K extends LinearConvertiblePhysicalProperty<K>> extends Unit<K> {
  const LinearConvertibleUnit(LinearConvertibleSystemOfUnits<K> systemOfMeasurent,
      {required String name, required String symbol})
      : super(systemOfMeasurent, name: name, symbol: symbol);

  @override
  LinearConvertibleSystemOfUnits<K> get systemOfMeasurent =>
      super.systemOfMeasurent as LinearConvertibleSystemOfUnits<K>;
}
