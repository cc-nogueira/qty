import 'package:equatable/equatable.dart';

import '../measurement/physical_property.dart';
import '../measurement/unit.dart';

/// Quantity to portray the amount of Physical Quantity, defined as a combination o magnitude and unit.
///
/// Expressed as some [amount] of a [unit].
/// Defines math operations for quantities.
class Quantity<K extends PhysicalProperty> extends Equatable
    implements Comparable<Quantity> {
  const Quantity({required this.amount, required this.unit});

  final Unit<K> unit;
  final double amount;

  /// Returns a new Quantity with the receiver's unit and the other quantity converted and added
  Quantity<K> operator +(Quantity<K> qtd) =>
      Quantity(unit: unit, amount: amount + qtd.convertTo(unit).amount);

  /// Returns a new Quantity with the receiver's unit and the other quantity converted and subtraccted
  Quantity<K> operator -(Quantity<K> qtd) =>
      Quantity<K>(unit: unit, amount: amount - qtd.convertTo(unit).amount);

  /// Returns a new Quantity with the same unit and my amount multiplied by a factor
  Quantity<K> operator *(double factor) =>
      Quantity<K>(unit: unit, amount: amount * factor);

  /// Returns a new Quantity with the same unit and my amount divided by a factor
  Quantity<K> operator /(double factor) =>
      Quantity<K>(unit: unit, amount: amount / factor);

  /// Returns a new Quantity with the same unit and this amount negated
  Quantity<K> get negated => Quantity<K>(unit: unit, amount: -amount);

  /// Returns a new Quantity with the same unit and zero amount
  Quantity<K> get zero => Quantity<K>(unit: unit, amount: 0.0);

  /// Returns a new Quantity converted to another unit.
  Quantity<K> convertTo(Unit<K> anotherUnit) {
    double converted;
    if (anotherUnit == unit) {
      converted = amount;
    } else {
      converted = unit.quantityConverterTo(anotherUnit)(amount);
    }
    return Quantity<K>(unit: anotherUnit, amount: converted);
  }

  /// Check if two quantities are equivalent when converted to the same unit.
  bool equivalent(Quantity<K> qtd) =>
      unit.sameKind(qtd.unit) && amount == qtd.convertTo(unit).amount;

  String print({bool useName = false, int? fractionDigits}) {
    final unitPrint = useName ? unit.name : unit.symbol;
    final valuePrint = fractionDigits == null
        ? amount.toString()
        : amount.toStringAsFixed(fractionDigits);
    return valuePrint + ' ' + unitPrint + (useName && amount != 1.0 ? 's' : '');
  }

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
