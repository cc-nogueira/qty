import 'package:qty/mass.dart';
import 'package:qty/quantities.dart';

void main() {
  print('Quantity construction:');
  print('Quantity q1 = Mass.grams(amount: 200.0);');
  print('Quantity q2 = Quantity(amount: 2.0, unit: Mass.kg);');
  print('Quantity q3 = Mass.ounces(amount: 10.0);');
  print('Quantity q4 = Quantity(amount: 5.0, unit: Mass().unitWith(symbol: \'lb\'));');
  Quantity q1, q2, q3, q4;
  q1 = Mass.grams(amount: 200.0);
  q2 = Quantity(amount: 2.0, unit: Mass.kg);
  q3 = Mass.ounces(amount: 10.0);
  q4 = Quantity(amount: 5.0, unit: Mass().unitWith(symbol: 'lb'));
  print('');
  print('Yields:');
  print('q1 = $q1');
  print('q2 = $q2');
  print('q3 = $q3');
  print('q4 = $q4');

  print('');
  print('Dealing with quantities in different units:');
  print('q1 + q2 = ${q1 + q2}');
  print('q2 + q1 = ${q2 + q1}');
  print('q3 + q4 = ${q3 + q4}');
  print('q2 in lb = ${q2.convertTo(Mass.lb)}');
}
