import 'package:test/test.dart';
import 'package:qty/qty.dart';

void main() {
  test('Dimensionless quantities', () {
    final un = Dimensionless.un;
    final tenUnits = Dimensionless.units(amount: 10.0);
    final tenUnitsToUnits = tenUnits.convertTo(un);
    expect(tenUnits.unit, un);
    expect(tenUnits.amount, 10.0);
    expect(tenUnitsToUnits.unit, un);
    expect(tenUnitsToUnits.amount, 10.0);
  });

  test('Mass quantity conversions', () {
    final g = Mass.g;
    final kg = Mass.kg;
    final mg = Mass.mg;
    final tenGrams = Mass.grams(amount: 10.0);
    final tenGramsToMillis = tenGrams.convertTo(mg);
    final tenGramsToGrams = tenGrams.convertTo(g);
    final tenGramsToKilos = tenGrams.convertTo(kg);
    expect(tenGramsToMillis.unit, mg);
    expect(tenGramsToMillis.amount, 10.0 * 1000.0);
    expect(tenGramsToGrams.unit, g);
    expect(tenGramsToGrams.amount, 10.0);
    expect(tenGramsToKilos.unit, kg);
    expect(tenGramsToKilos.amount, 10.0 * 0.001);
  });

  test('Volume quantity conversions', () {
    final cm3 = Volume.cm3;
    final dm3 = Volume.dm3;
    final m3 = Volume.m3;
    final tenLiters = Volume.liters(amount: 10.0);
    final tenLitersToCm3 = tenLiters.convertTo(cm3);
    final tenLitersToDm3 = tenLiters.convertTo(dm3);
    final tenLitersToM3 = tenLiters.convertTo(m3);
    expect(tenLitersToCm3.unit, cm3);
    expect(tenLitersToCm3.amount, 10.0 * 1000.0);
    expect(tenLitersToDm3.unit, dm3);
    expect(tenLitersToDm3.amount, 10.0);
    expect(tenLitersToM3.unit, m3);
    expect(tenLitersToM3.amount, 10.0 * 0.001);
  });

  test('Unit quantity plus operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final sixAndAHalfUnits = Quantity(amount: 6.5);
    final nineGrams = Mass.grams(amount: 9.0);
    final tenGrams = Mass.grams(amount: 10.0);
    final elevenKilos = Mass.kilograms(amount: 11.0);
    final twelveMillis = Mass.milligrams(amount: 12.0);
    final fivePlusSixAndAHalf = fiveUnits + sixAndAHalfUnits;
    final nineGramsPlusTenGrams = nineGrams + tenGrams;
    final nineGramsPlusElevenKilos = nineGrams + elevenKilos;
    final nineGramsPlusTwelveMillis = nineGrams + twelveMillis;
    final elevenKilosPlusTenGrams = elevenKilos + tenGrams;
    final twelveMillisPlusTenGrams = twelveMillis + tenGrams;
    final elevenKilosPlusTwelveMillis = elevenKilos + twelveMillis;
    expect(fivePlusSixAndAHalf, Dimensionless.units(amount: 11.5));
    expect(fivePlusSixAndAHalf, Quantity(amount: 11.5));
    expect(nineGramsPlusTenGrams, Mass.grams(amount: 19.0));
    expect(nineGramsPlusElevenKilos, Mass.grams(amount: 11009.0));
    expect(nineGramsPlusTwelveMillis, Mass.grams(amount: 9.012));
    expect(elevenKilosPlusTenGrams, Mass.kilograms(amount: 11.010));
    expect(twelveMillisPlusTenGrams, Mass.milligrams(amount: 10012.0));
    expect(elevenKilosPlusTwelveMillis, Mass.kilograms(amount: 11.000012));
  });

  test('Unit quantity minus operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final sixAndAHalfUnits = Quantity(amount: 6.5);
    final nineGrams = Mass.grams(amount: 9.0);
    final tenGrams = Mass.grams(amount: 10.0);
    final elevenKilos = Mass.kilograms(amount: 11.0);
    final twelveMillis = Mass.milligrams(amount: 12.0);
    final fiveMinusSixAndAHalf = fiveUnits - sixAndAHalfUnits;
    final sixAndAHalfMinusFive = sixAndAHalfUnits - fiveUnits;
    final nineGramsMinusTenGrams = nineGrams - tenGrams;
    final nineGramsMinusElevenKilos = nineGrams - elevenKilos;
    final nineGramsMinusTwelveMillis = nineGrams - twelveMillis;
    final elevenKilosMinusTenGrams = elevenKilos - tenGrams;
    final twelveMillisMinusTenGrams = twelveMillis - tenGrams;
    final elevenKiloMinusTwelveMillis = elevenKilos - twelveMillis;
    expect(fiveMinusSixAndAHalf, Quantity(amount: -1.5));
    expect(sixAndAHalfMinusFive, Quantity(amount: 1.5));
    expect(nineGramsMinusTenGrams, Mass.grams(amount: -1.0));
    expect(nineGramsMinusElevenKilos, Mass.grams(amount: -10991.0));
    expect(nineGramsMinusTwelveMillis, Mass.grams(amount: 8.988));
    expect(elevenKilosMinusTenGrams, Mass.kilograms(amount: 10.990));
    expect(twelveMillisMinusTenGrams, Mass.milligrams(amount: -9988.0));
    expect(elevenKiloMinusTwelveMillis, Mass.kilograms(amount: 10.999988));
  });

  test('Unit quantity * operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final nineGrams = Mass.grams(amount: 9.0);
    expect(fiveUnits * 3.0, Quantity(amount: 15.0));
    expect(fiveUnits * 3.5, Quantity(amount: 17.5));
    expect(nineGrams * 3.0, Mass.grams(amount: 27.0));
    expect(nineGrams * 3.5, Mass.grams(amount: 31.5));
  });

  test('Unit quantity / operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final nineGrams = Mass.grams(amount: 9.0);
    expect(fiveUnits / 2.0, Quantity(amount: 2.5));
    expect(fiveUnits / 2.5, Quantity(amount: 2.0));
    expect(nineGrams / 3.0, Mass.grams(amount: 3.0));
    expect(nineGrams / 2.0, Mass.grams(amount: 4.5));
  });
}
