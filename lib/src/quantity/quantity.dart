import 'package:equatable/equatable.dart';

import '../measurement/measurement.dart';
import '../physical_property/dimensionless.dart';

/// Quantity to portray the amount of Physical Quantity, defined as a combination o magnitude and unit.
///
/// Expressed as some [amount] of a [Unit]
class Quantity extends Equatable implements Comparable<Quantity> {
  Quantity({required this.amount, Unit? unit}) : unit = unit ?? Dimensionless.un;

  final Unit unit;
  final double amount;

  Quantity operator +(Quantity qtd) => Quantity(unit: unit, amount: amount + qtd.convertTo(unit).amount);
  Quantity operator -(Quantity qtd) => Quantity(unit: unit, amount: amount - qtd.convertTo(unit).amount);
  Quantity operator *(double factor) => Quantity(unit: unit, amount: amount * factor);
  Quantity operator /(double factor) => Quantity(unit: unit, amount: amount / factor);

  Quantity convertTo(Unit anotherUnit) {
    double converted;
    if (anotherUnit == unit) {
      converted = amount;
    } else {
      converted = unit.quantityConverterTo(anotherUnit)(amount);
    }
    return Quantity(unit: anotherUnit, amount: converted);
  }

  Quantity get negated => Quantity(unit: unit, amount: -amount);
  Quantity get zero => Quantity(unit: unit, amount: 0.0);

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
