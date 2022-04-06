import 'package:qty/qty.dart';
import 'package:test/test.dart';

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

  test('Speed quantity conversions', () {
    final mPerS = Speed.m_s;
    final kmPerHr = Speed.km_h;
    final miPerHr = Speed.mi_h;
    final kt = Speed.kt;
    final tenMetersPerSecond = Speed.metersPerSecond(amount: 10.0);
    final tenMetersPerSecondToKmPerHour = tenMetersPerSecond.convertTo(kmPerHr);
    final tenMetersPerSecondToMiPerHour = tenMetersPerSecond.convertTo(miPerHr);
    final tenMetersPerSecondToKnots = tenMetersPerSecond.convertTo(kt);
    expect(tenMetersPerSecond.unit, mPerS);
    expect(tenMetersPerSecond.amount, 10.0);
    expect(tenMetersPerSecondToKmPerHour.unit, kmPerHr);
    expect(tenMetersPerSecondToKmPerHour.amount, 10.0 * 3.6);
    expect(tenMetersPerSecondToMiPerHour.unit, miPerHr);
    expect(tenMetersPerSecondToMiPerHour.amount, 36.0 / 1.609344);
    expect(tenMetersPerSecondToKnots.unit, kt);
    expect(tenMetersPerSecondToKnots.amount,
        inInclusiveRange(10.0 / 0.514444445, 10.0 / 0.514444444));
  });

  test('Unit quantity plus operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final sixAndAHalfUnits = Quantity(amount: 6.5, unit: Dimensionless.un);
    final nineGrams = Mass.grams(amount: 9.0);
    final tenGrams = Mass.grams(amount: 10.0);
    final elevenKilos = Mass.kilograms(amount: 11.0);
    final twelveMillis = Mass.milligrams(amount: 12.0);
    final tenMetersPerSecond = Speed.metersPerSecond(amount: 10.0);
    final elevenMetersPerSecond = Speed.metersPerSecond(amount: 11.0);
    final twelveKilometersPerHour = Speed.kilometersPerHour(amount: 12.0);
    final nineKnots = Speed.knots(amount: 9.0);

    final fivePlusSixAndAHalf = fiveUnits + sixAndAHalfUnits;
    final nineGramsPlusTenGrams = nineGrams + tenGrams;
    final nineGramsPlusElevenKilos = nineGrams + elevenKilos;
    final nineGramsPlusTwelveMillis = nineGrams + twelveMillis;
    final elevenKilosPlusTenGrams = elevenKilos + tenGrams;
    final twelveMillisPlusTenGrams = twelveMillis + tenGrams;
    final elevenKilosPlusTwelveMillis = elevenKilos + twelveMillis;
    final tenMpsPlusElevenMps = tenMetersPerSecond + elevenMetersPerSecond;
    final tenMpsPlusTwelveKph = tenMetersPerSecond + twelveKilometersPerHour;
    final tenMpsPlusNineKt = tenMetersPerSecond + nineKnots;
    final nineKtPlusTenMps = nineKnots + tenMetersPerSecond;

    expect(fivePlusSixAndAHalf, Dimensionless.units(amount: 11.5));
    expect(fivePlusSixAndAHalf, Quantity(amount: 11.5, unit: Dimensionless.un));
    expect(nineGramsPlusTenGrams, Mass.grams(amount: 19.0));
    expect(nineGramsPlusElevenKilos, Mass.grams(amount: 11009.0));
    expect(nineGramsPlusTwelveMillis, Mass.grams(amount: 9.012));
    expect(elevenKilosPlusTenGrams, Mass.kilograms(amount: 11.010));
    expect(twelveMillisPlusTenGrams, Mass.milligrams(amount: 10012.0));
    expect(elevenKilosPlusTwelveMillis, Mass.kilograms(amount: 11.000012));
    expect(tenMpsPlusElevenMps, Speed.metersPerSecond(amount: 21.0));
    expect(tenMpsPlusTwelveKph.amount,
        inInclusiveRange(10.0 + 12.0 / 3.6, 10.0 + 12.0001 / 3.6));
    expect(tenMpsPlusNineKt.amount,
        inInclusiveRange(10.0 + 9.0 * 0.514444444, 10.0 + 9.0 * 0.514444445));
    expect(nineKtPlusTenMps.amount,
        inInclusiveRange(9.0 + 10.0 / 0.514444445, 9.0 + 10.0 / 0.514444444));
  });

  test('Unit quantity minus operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final sixAndAHalfUnits = Quantity(amount: 6.5, unit: Dimensionless.un);
    final nineGrams = Mass.grams(amount: 9.0);
    final tenGrams = Mass.grams(amount: 10.0);
    final elevenKilos = Mass.kilograms(amount: 11.0);
    final twelveMillis = Mass.milligrams(amount: 12.0);
    final tenMetersPerSecond = Speed.metersPerSecond(amount: 10.0);
    final elevenMetersPerSecond = Speed.metersPerSecond(amount: 11.0);
    final twelveKilometersPerHour = Speed.kilometersPerHour(amount: 12.0);
    final nineKnots = Speed.knots(amount: 9.0);

    final fiveMinusSixAndAHalf = fiveUnits - sixAndAHalfUnits;
    final sixAndAHalfMinusFive = sixAndAHalfUnits - fiveUnits;
    final nineGramsMinusTenGrams = nineGrams - tenGrams;
    final nineGramsMinusElevenKilos = nineGrams - elevenKilos;
    final nineGramsMinusTwelveMillis = nineGrams - twelveMillis;
    final elevenKilosMinusTenGrams = elevenKilos - tenGrams;
    final twelveMillisMinusTenGrams = twelveMillis - tenGrams;
    final elevenKiloMinusTwelveMillis = elevenKilos - twelveMillis;
    final tenMpsMinusElevenMps = tenMetersPerSecond - elevenMetersPerSecond;
    final tenMpsMinusTwelveKph = tenMetersPerSecond - twelveKilometersPerHour;
    final tenMpsMinusNineKt = tenMetersPerSecond - nineKnots;
    final nineKtMinusTenMps = nineKnots - tenMetersPerSecond;

    expect(
        fiveMinusSixAndAHalf, Quantity(amount: -1.5, unit: Dimensionless.un));
    expect(sixAndAHalfMinusFive, Quantity(amount: 1.5, unit: Dimensionless.un));
    expect(nineGramsMinusTenGrams, Mass.grams(amount: -1.0));
    expect(nineGramsMinusElevenKilos, Mass.grams(amount: -10991.0));
    expect(nineGramsMinusTwelveMillis, Mass.grams(amount: 8.988));
    expect(elevenKilosMinusTenGrams, Mass.kilograms(amount: 10.990));
    expect(twelveMillisMinusTenGrams, Mass.milligrams(amount: -9988.0));
    expect(elevenKiloMinusTwelveMillis, Mass.kilograms(amount: 10.999988));
    expect(tenMpsMinusElevenMps, Speed.metersPerSecond(amount: -1.0));
    expect(tenMpsMinusTwelveKph.amount,
        inInclusiveRange(10.0 - 12.0001 / 3.6, 10.0 - 12.0 / 3.6));
    expect(tenMpsMinusNineKt.amount,
        inInclusiveRange(10.0 - 9.0 * 0.514444445, 10.0 - 9.0 * 0.514444444));
    expect(nineKtMinusTenMps.amount,
        inInclusiveRange(9.0 - 10.0 / 0.514444444, 9.0 - 10.0 / 0.514444445));
  });

  test('Unit quantity * operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final nineGrams = Mass.grams(amount: 9.0);
    final nineKnots = Speed.knots(amount: 9.0);
    expect(fiveUnits * 3.0, Quantity(amount: 15.0, unit: Dimensionless.un));
    expect(fiveUnits * 3.5, Quantity(amount: 17.5, unit: Dimensionless.un));
    expect(nineGrams * 3.0, Mass.grams(amount: 27.0));
    expect(nineGrams * 3.5, Mass.grams(amount: 31.5));
    expect(nineKnots * 3.0, Speed.knots(amount: 27.0));
    expect(nineKnots * 3.5, Speed.knots(amount: 31.5));
  });

  test('Unit quantity / operator', () {
    final fiveUnits = Dimensionless.units(amount: 5.0);
    final nineGrams = Mass.grams(amount: 9.0);
    final nineKnots = Speed.knots(amount: 9.0);
    expect(fiveUnits / 2.0, Quantity(amount: 2.5, unit: Dimensionless.un));
    expect(fiveUnits / 2.5, Quantity(amount: 2.0, unit: Dimensionless.un));
    expect(nineGrams / 3.0, Mass.grams(amount: 3.0));
    expect(nineGrams / 2.0, Mass.grams(amount: 4.5));
    expect(nineKnots / 3.0, Speed.knots(amount: 3.0));
    expect(nineKnots / 2.0, Speed.knots(amount: 4.5));
  });
}
