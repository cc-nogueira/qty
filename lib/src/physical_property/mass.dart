import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Mass physical property.
///
/// Configures Internation (SI) and Imperial/US systems of units defining their [Mass] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class Mass extends PhysicalProperty<Mass> {
  factory Mass() => _instance ??= Mass._();

  Mass._() : super(kind: 'mass', dimensionSymbol: 'M', quantitySymbol: 'm');

  static Mass? _instance;

  // SI
  late final Unit<Mass> gram;

  late final Unit<Mass> decigram;
  late final Unit<Mass> centigram;
  late final Unit<Mass> milligram;
  late final Unit<Mass> microgram;
  late final Unit<Mass> nanogram;
  late final Unit<Mass> picogram;
  late final Unit<Mass> femtogram;
  late final Unit<Mass> attogram;
  late final Unit<Mass> zeptogram;
  late final Unit<Mass> yoctogram;

  late final Unit<Mass> decagram;
  late final Unit<Mass> hectogram;
  late final Unit<Mass> kilogram;
  late final Unit<Mass> megagram;
  late final Unit<Mass> gigagram;
  late final Unit<Mass> teragram;
  late final Unit<Mass> petagram;
  late final Unit<Mass> exagram;
  late final Unit<Mass> zettagram;
  late final Unit<Mass> yottagram;

  // Non-SI
  late final Unit<Mass> ton;

  // Imperial/US
  late final Unit<Mass> pound;

  late final Unit<Mass> ounce;
  late final Unit<Mass> drachm;
  late final Unit<Mass> grain;

  late final Unit<Mass> stone;
  late final Unit<Mass> quarter;
  late final Unit<Mass> kip;

  // SI
  static Quantity<Mass> grams(double amount) => Quantity(unit: Mass().gram, amount: amount);

  static Quantity<Mass> decigrams(double amount) => Quantity(unit: Mass().decigram, amount: amount);
  static Quantity<Mass> centigrams(double amount) =>
      Quantity(unit: Mass().centigram, amount: amount);
  static Quantity<Mass> milligrams(double amount) =>
      Quantity(unit: Mass().milligram, amount: amount);
  static Quantity<Mass> micrograms(double amount) =>
      Quantity(unit: Mass().microgram, amount: amount);
  static Quantity<Mass> nanograms(double amount) => Quantity(unit: Mass().nanogram, amount: amount);
  static Quantity<Mass> picograms(double amount) => Quantity(unit: Mass().picogram, amount: amount);
  static Quantity<Mass> femtograms(double amount) =>
      Quantity(unit: Mass().femtogram, amount: amount);
  static Quantity<Mass> attograms(double amount) => Quantity(unit: Mass().attogram, amount: amount);
  static Quantity<Mass> zeptograms(double amount) =>
      Quantity(unit: Mass().zeptogram, amount: amount);
  static Quantity<Mass> yoctograms(double amount) =>
      Quantity(unit: Mass().yoctogram, amount: amount);

  static Quantity<Mass> decagrams(double amount) => Quantity(unit: Mass().decagram, amount: amount);
  static Quantity<Mass> hectograms(double amount) =>
      Quantity(unit: Mass().hectogram, amount: amount);
  static Quantity<Mass> kilograms(double amount) => Quantity(unit: Mass().kilogram, amount: amount);
  static Quantity<Mass> megagrams(double amount) => Quantity(unit: Mass().megagram, amount: amount);
  static Quantity<Mass> gigagrams(double amount) => Quantity(unit: Mass().gigagram, amount: amount);
  static Quantity<Mass> teragrams(double amount) => Quantity(unit: Mass().teragram, amount: amount);
  static Quantity<Mass> petagrams(double amount) => Quantity(unit: Mass().petagram, amount: amount);
  static Quantity<Mass> exagrams(double amount) => Quantity(unit: Mass().exagram, amount: amount);
  static Quantity<Mass> zettagrams(double amount) =>
      Quantity(unit: Mass().zettagram, amount: amount);
  static Quantity<Mass> yottagrams(double amount) =>
      Quantity(unit: Mass().yottagram, amount: amount);

  // Non-SI
  static Quantity<Mass> tons(double amount) => Quantity(unit: Mass().ton, amount: amount);

  // Imperial/US
  static Quantity<Mass> pounds(double amount) => Quantity(unit: Mass().pound, amount: amount);
  static Quantity<Mass> ounces(double amount) => Quantity(unit: Mass().ounce, amount: amount);
  static Quantity<Mass> drachms(double amount) => Quantity(unit: Mass().drachm, amount: amount);
  static Quantity<Mass> grains(double amount) => Quantity(unit: Mass().grain, amount: amount);
  static Quantity<Mass> stones(double amount) => Quantity(unit: Mass().stone, amount: amount);
  static Quantity<Mass> quarters(double amount) => Quantity(unit: Mass().quarter, amount: amount);
  static Quantity<Mass> kips(double amount) => Quantity(unit: Mass().kip, amount: amount);

  @override
  void defineUnits() {
    // SI based:
    final si = InternationalSystemOfUnits<Mass>(kind: this);
    gram = si.defineBaseUnit(symbol: 'g', name: 'gram', factor: 1.0);

    decigram = si.defineUnit(symbol: 'dg', name: 'decigram', factor: 1e-1);
    centigram = si.defineUnit(symbol: 'cg', name: 'centigram', factor: 1e-2);
    milligram = si.defineUnit(symbol: 'mg', name: 'milligram', factor: 1e-3);
    microgram = si.defineUnit(symbol: 'μg', name: 'microgram', factor: 1e-6);
    nanogram = si.defineUnit(symbol: 'ng', name: 'nanogram', factor: 1e-9);
    picogram = si.defineUnit(symbol: 'pg', name: 'picogram', factor: 1e-12);
    femtogram = si.defineUnit(symbol: 'fg', name: 'femtogram', factor: 1e-15);
    attogram = si.defineUnit(symbol: 'ag', name: 'attogram', factor: 1e-18);
    zeptogram = si.defineUnit(symbol: 'zg', name: 'zeptogram', factor: 1e-21);
    yoctogram = si.defineUnit(symbol: 'yg', name: 'yoctogram', factor: 1e-24);

    decagram = si.defineUnit(symbol: 'dag', name: 'decagram', factor: 1e1);
    hectogram = si.defineUnit(symbol: 'hg', name: 'hectogram', factor: 1e2);
    kilogram = si.defineUnit(symbol: 'kg', name: 'kilogram', factor: 1e3);
    megagram = si.defineUnit(symbol: 'Mg', name: 'megagram', factor: 1e6);
    gigagram = si.defineUnit(symbol: 'Gg', name: 'gigagram', factor: 1e9);
    teragram = si.defineUnit(symbol: 'Tg', name: 'teragram', factor: 1e12);
    petagram = si.defineUnit(symbol: 'Pg', name: 'petagram', factor: 1e15);
    exagram = si.defineUnit(symbol: 'Eg', name: 'exagram', factor: 1e18);
    zettagram = si.defineUnit(symbol: 'Zg', name: 'zettagram', factor: 1e21);
    yottagram = si.defineUnit(symbol: 'Yg', name: 'yottagram', factor: 1e24);

    // SI correlated:
    ton = si.defineUnit(symbol: 't', name: 'tonne', factor: 1e6);

    // Imperial/US
    final imperial = SystemOfUnits<Mass>(kind: this, name: 'Imperial/US System of Units');
    pound = imperial.defineBaseUnit(symbol: 'lb', name: 'pound', factor: 453.59237);

    ounce = imperial.defineUnit(symbol: 'oz', name: 'ounce', factor: 1.0 / 16.0);
    drachm = imperial.defineUnit(symbol: 'dr', name: 'dr', factor: 1.0 / 256.0);
    grain = imperial.defineUnit(symbol: 'gr', name: 'grain', factor: 1.0 / 7000.0);
    stone = imperial.defineUnit(symbol: 'st', name: 'stone', factor: 14.0);
    quarter = imperial.defineUnit(symbol: 'qr', name: 'quarter', factor: 28.0);
    kip = imperial.defineUnit(symbol: 'kip', name: 'kilopound', factor: 1e3);

    systemsOfUnits.addAll([si, imperial]);
  }
}
