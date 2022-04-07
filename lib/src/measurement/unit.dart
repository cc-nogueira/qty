import 'package:equatable/equatable.dart';
import 'physical_property.dart';
import 'systems_of_units.dart';
import 'unit_converter.dart';

/// Unit of a physical property.
///
/// Expressed with a [symbol] in a [systemOfUnits] for its kind of [PhysicalProperty] (volume, mass, legnth, etc).
/// Provides access to a [QuantityConverter] to another [Unit] of the same kind of [PhysicalProperty].
class Unit<K extends PhysicalProperty<K>> extends Equatable {
  const Unit(this.systemOfUnits, {required this.name, required this.symbol});

  final SystemOfUnits<K> systemOfUnits;
  final String symbol;
  final String name;

  PhysicalProperty get kind => systemOfUnits.kind;

  /// Compare if another unit is of the same kind
  bool sameKind(Unit unit) => systemOfUnits.sameKind(unit.systemOfUnits);

  /// Compose a QuantityConverter function to convert amounts to another unit.
  QuantityConverter quantityConverterTo(Unit<K> newUnit) {
    if (systemOfUnits == newUnit.systemOfUnits) {
      return systemOfUnits.quantityConverter(fromUnit: this, toUnit: newUnit);
    }
    final newBaseUnitConverter = newUnit.systemOfUnits.baseUnit.quantityConverterTo(newUnit);
    final thisToBaseConverter = quantityConverterTo(systemOfUnits.baseUnit);
    final thisBaseToNewBaseConverter = systemOfUnits.baseUnitConverterTo(newUnit.systemOfUnits);
    return (amount) =>
        newBaseUnitConverter(thisBaseToNewBaseConverter(thisToBaseConverter(amount)));
  }

  @override
  List<Object> get props => [systemOfUnits.kind, systemOfUnits.name, symbol, name];
}
