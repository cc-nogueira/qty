import 'package:equatable/equatable.dart';

import '../measurement/measurement.dart';
import '../physical_property/dimensionless.dart';

/// Quantity to portray the amount of Physical Quantity, defined as a combination o magnitude and unit.
///
/// Expressed as some [amount] of a [unit].
/// Defines math operations for quantities.
class Quantity extends Equatable implements Comparable<Quantity> {
  Quantity({required this.amount, Unit? unit}) : unit = unit ?? Dimensionless.un;

  final Unit unit;
  final double amount;

  /// Returns a new Quantity with the receiver's unit and the other quantity converted and added
  Quantity operator +(Quantity qtd) => Quantity(unit: unit, amount: amount + qtd.convertTo(unit).amount);

  /// Returns a new Quantity with the receiver's unit and the other quantity converted and subtraccted
  Quantity operator -(Quantity qtd) => Quantity(unit: unit, amount: amount - qtd.convertTo(unit).amount);

  /// Returns a new Quantity with the same unit and my amount multiplied by a factor
  Quantity operator *(double factor) => Quantity(unit: unit, amount: amount * factor);

  /// Returns a new Quantity with the same unit and my amount divided by a factor
  Quantity operator /(double factor) => Quantity(unit: unit, amount: amount / factor);

  /// Returns a new Quantity with the same unit and this amount negated
  Quantity get negated => Quantity(unit: unit, amount: -amount);

  /// Returns a new Quantity with the same unit and zero amount
  Quantity get zero => Quantity(unit: unit, amount: 0.0);

  /// Returns a new Quantity converted to another unit.
  Quantity convertTo(Unit anotherUnit) {
    double converted;
    if (anotherUnit == unit) {
      converted = amount;
    } else {
      converted = unit.quantityConverterTo(anotherUnit)(amount);
    }
    return Quantity(unit: anotherUnit, amount: converted);
  }

  /// Check if two quantities are equivalent when converted to the same unit.
  bool equivalent(Quantity qtd) => unit.sameKind(qtd.unit) && amount == qtd.convertTo(unit).amount;

  @override
  int compareTo(Quantity other) {
    if (unit == other.unit) {
      return amount.compareTo(other.amount);
    } else {
      return amount.compareTo(other.convertTo(unit).amount);
    }
  }

  @override
  String toString() => '$amount ${unit.symbol}';

  @override
  List<Object> get props => [unit, amount];
}
