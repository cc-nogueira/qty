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

  late final InternationalSystemOfUnits<Mass> _siUnits;
  late final SystemOfUnits<Mass> _imperialUsUnits;

  // SI
  late final gram = _siUnits.defineBaseUnit(symbol: 'g', name: 'gram', factor: 1.0);

  late final decigram = _siUnits.defineUnit(symbol: 'dg', name: 'decigram', factor: 1e-1);
  late final centigram = _siUnits.defineUnit(symbol: 'cg', name: 'centigram', factor: 1e-2);
  late final milligram = _siUnits.defineUnit(symbol: 'mg', name: 'milligram', factor: 1e-3);
  late final microgram = _siUnits.defineUnit(symbol: 'μg', name: 'microgram', factor: 1e-6);
  late final nanogram = _siUnits.defineUnit(symbol: 'ng', name: 'nanogram', factor: 1e-9);
  late final picogram = _siUnits.defineUnit(symbol: 'pg', name: 'picogram', factor: 1e-12);
  late final femtogram = _siUnits.defineUnit(symbol: 'fg', name: 'femtogram', factor: 1e-15);
  late final attogram = _siUnits.defineUnit(symbol: 'ag', name: 'attogram', factor: 1e-18);
  late final zeptogram = _siUnits.defineUnit(symbol: 'zg', name: 'zeptogram', factor: 1e-21);
  late final yoctogram = _siUnits.defineUnit(symbol: 'yg', name: 'yoctogram', factor: 1e-24);

  late final decagram = _siUnits.defineUnit(symbol: 'dag', name: 'decagram', factor: 1e1);
  late final hectogram = _siUnits.defineUnit(symbol: 'hg', name: 'hectogram', factor: 1e2);
  late final kilogram = _siUnits.defineUnit(symbol: 'kg', name: 'kilogram', factor: 1e3);
  late final megagram = _siUnits.defineUnit(symbol: 'Mg', name: 'megagram', factor: 1e6);
  late final gigagram = _siUnits.defineUnit(symbol: 'Gg', name: 'gigagram', factor: 1e9);
  late final teragram = _siUnits.defineUnit(symbol: 'Tg', name: 'teragram', factor: 1e12);
  late final petagram = _siUnits.defineUnit(symbol: 'Pg', name: 'petagram', factor: 1e15);
  late final exagram = _siUnits.defineUnit(symbol: 'Eg', name: 'exagram', factor: 1e18);
  late final zettagram = _siUnits.defineUnit(symbol: 'Zg', name: 'zettagram', factor: 1e21);
  late final yottagram = _siUnits.defineUnit(symbol: 'Yg', name: 'yottagram', factor: 1e24);

  // Non-SI
  late final ton = _siUnits.defineUnit(symbol: 't', name: 'tonne', factor: 1e6);

  // Imperial/US
  late final pound =
      _imperialUsUnits.defineBaseUnit(symbol: 'lb', name: 'pound', factor: 453.59237);

  late final ounce = _imperialUsUnits.defineUnit(symbol: 'oz', name: 'ounce', factor: 1.0 / 16.0);
  late final drachm = _imperialUsUnits.defineUnit(symbol: 'dr', name: 'dr', factor: 1.0 / 256.0);
  late final grain = _imperialUsUnits.defineUnit(symbol: 'gr', name: 'grain', factor: 1.0 / 7000.0);

  late final stone = _imperialUsUnits.defineUnit(symbol: 'st', name: 'stone', factor: 14.0);
  late final quarter = _imperialUsUnits.defineUnit(symbol: 'qr', name: 'quarter', factor: 28.0);
  late final kip = _imperialUsUnits.defineUnit(symbol: 'kip', name: 'kilopound', factor: 1e3);

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
  void defineSystemsOfUnits() {
    _siUnits = InternationalSystemOfUnits<Mass>(kind: this);
    gram;

    _imperialUsUnits = SystemOfUnits<Mass>(kind: this, name: 'Imperial/US System of Units');
    pound;

    systemsOfUnits.addAll([_siUnits, _imperialUsUnits]);
  }

  @override
  void loadAllUnits() {
    // SI:
    decigram;
    centigram;
    milligram;
    microgram;
    nanogram;
    picogram;
    femtogram;
    attogram;
    zeptogram;
    yoctogram;

    decagram;
    hectogram;
    kilogram;
    megagram;
    gigagram;
    teragram;
    petagram;
    exagram;
    zettagram;
    yottagram;

    // SI correlated:
    ton;

    // Imperial/US
    ounce;
    drachm;
    grain;
    stone;
    quarter;
    kip;
  }
}
