import 'package:qty/qty.dart';

/// This example walk through different funcionalities using Mass.
/// Same API also works for other physical properties, such as Volume and Length.
void main() {
  print('Available units of mass:');
  for (var system in Mass().systemsOfUnits) {
    final units = system.units..sort((a, b) => a.symbol.compareTo(b.symbol));
    print('In ${system.name}:');
    for (var unit in units) {
      print('${unit.symbol.padLeft(5)} - ${unit.name}');
    }
  }

  print('');
  print('Quantity construction through Quantity or PhysicalProperty classes:');
  print('Quantity q1 = Mass.grams(amount: 200.0);');
  print('Quantity q2 = Quantity(amount: 2.0, unit: Mass.kg);');
  print('Quantity q3 = Mass.ounces(amount: 10.0);');
  print('Quantity q4 = Quantity(amount: 5.0, unit: Mass().unitWith(symbol: \'lb\'));');
  final q1 = Mass.grams(amount: 200.0);
  final q2 = Quantity(amount: 2.0, unit: Mass.kg);
  final q3 = Mass.ounces(amount: 10.0);
  final q4 = Quantity(amount: 5.0, unit: Mass().unitWith(symbol: 'lb')!);

  print('');
  print('Yields:');
  print('q1 = $q1');
  print('q2 = $q2');
  print('q3 = $q3');
  print('q4 = $q4');

  print('');
  print('Manipulating quantities in different units:');
  print('q1 + q2 = ${q1 + q2}');
  print('q2 + q1 = ${q2 + q1}');
  print('q3 + q4 = ${q3 + q4}');

  print('');
  print('Unit conversion:');
  print('q2 in lb = ${q2.convertTo(Mass.lb)}');
}
