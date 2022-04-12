import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Electrical Current physical property singleton.
///
/// Configures Internation System of Units (SI) units defining its [ElectricalCurrent] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class LuminousIntensity extends PhysicalProperty<LuminousIntensity> {
  factory LuminousIntensity() => _instance ??= LuminousIntensity._();
  LuminousIntensity._()
      : super(kind: 'luminmous intensity', dimensionSymbol: 'J', quantitySymbol: 'Iv');

  static LuminousIntensity? _instance;

  late final InternationalSystemOfUnits<LuminousIntensity> _siUnits;
  late final SystemOfUnits<LuminousIntensity> _hefnerUnits;

  // SI
  late final candela = _siUnits.defineBaseUnit(symbol: 'cd', name: 'candela', factor: 1.0);

  late final decicandela = _siUnits.defineUnit(symbol: 'dcd', name: 'decicandela', factor: 1e-1);
  late final centicandela = _siUnits.defineUnit(symbol: 'ccd', name: 'centicandela', factor: 1e-2);
  late final millicandela = _siUnits.defineUnit(symbol: 'mcd', name: 'millicandela', factor: 1e-3);
  late final microcandela = _siUnits.defineUnit(symbol: 'μcd', name: 'microcandela', factor: 1e-6);
  late final nanocandela = _siUnits.defineUnit(symbol: 'ncd', name: 'nanocandela', factor: 1e-9);
  late final picocandela = _siUnits.defineUnit(symbol: 'pcd', name: 'picocandela', factor: 1e-12);
  late final femtocandela = _siUnits.defineUnit(symbol: 'fcd', name: 'femtocandela', factor: 1e-15);
  late final attocandela = _siUnits.defineUnit(symbol: 'acd', name: 'attocandela', factor: 1e-18);
  late final zeptocandela = _siUnits.defineUnit(symbol: 'zcd', name: 'zeptocandela', factor: 1e-21);
  late final yoctocandela = _siUnits.defineUnit(symbol: 'ycd', name: 'yoctocandela', factor: 1e-24);

  late final decacandela = _siUnits.defineUnit(symbol: 'dacd', name: 'decacandela', factor: 1e1);
  late final hectocandela = _siUnits.defineUnit(symbol: 'hcd', name: 'hectocandela', factor: 1e2);
  late final kilocandela = _siUnits.defineUnit(symbol: 'kcd', name: 'kilocandela', factor: 1e3);
  late final megacandela = _siUnits.defineUnit(symbol: 'Mcd', name: 'megacandela', factor: 1e6);
  late final gigacandela = _siUnits.defineUnit(symbol: 'Gcd', name: 'gigacandela', factor: 1e9);
  late final teracandela = _siUnits.defineUnit(symbol: 'Tcd', name: 'teracandela', factor: 1e12);
  late final petacandela = _siUnits.defineUnit(symbol: 'Pcd', name: 'petacandela', factor: 1e15);
  late final exacandela = _siUnits.defineUnit(symbol: 'Ecd', name: 'exacandela', factor: 1e18);
  late final zettacandela = _siUnits.defineUnit(symbol: 'Zcd', name: 'zettacandela', factor: 1e21);
  late final yottacandela = _siUnits.defineUnit(symbol: 'Ycd', name: 'yottacandela', factor: 1e24);

  late final hefnerKerze =
      _hefnerUnits.defineBaseUnit(symbol: 'HK', name: 'hefnerkerze', factor: 0.903);

  // SI
  static Quantity<LuminousIntensity> candelas(double amount) =>
      Quantity(unit: LuminousIntensity().candela, amount: amount);

  static Quantity<LuminousIntensity> decicandelas(double amount) =>
      Quantity(unit: LuminousIntensity().decicandela, amount: amount);
  static Quantity<LuminousIntensity> centicandelas(double amount) =>
      Quantity(unit: LuminousIntensity().centicandela, amount: amount);
  static Quantity<LuminousIntensity> millicandelas(double amount) =>
      Quantity(unit: LuminousIntensity().millicandela, amount: amount);
  static Quantity<LuminousIntensity> microcandelas(double amount) =>
      Quantity(unit: LuminousIntensity().microcandela, amount: amount);
  static Quantity<LuminousIntensity> nanocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().nanocandela, amount: amount);
  static Quantity<LuminousIntensity> picocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().picocandela, amount: amount);
  static Quantity<LuminousIntensity> femtocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().femtocandela, amount: amount);
  static Quantity<LuminousIntensity> attocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().attocandela, amount: amount);
  static Quantity<LuminousIntensity> zeptocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().zeptocandela, amount: amount);
  static Quantity<LuminousIntensity> yoctocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().yoctocandela, amount: amount);

  static Quantity<LuminousIntensity> decacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().decacandela, amount: amount);
  static Quantity<LuminousIntensity> hectocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().hectocandela, amount: amount);
  static Quantity<LuminousIntensity> kilocandelas(double amount) =>
      Quantity(unit: LuminousIntensity().kilocandela, amount: amount);
  static Quantity<LuminousIntensity> megacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().megacandela, amount: amount);
  static Quantity<LuminousIntensity> gigacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().gigacandela, amount: amount);
  static Quantity<LuminousIntensity> teracandelas(double amount) =>
      Quantity(unit: LuminousIntensity().teracandela, amount: amount);
  static Quantity<LuminousIntensity> petacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().petacandela, amount: amount);
  static Quantity<LuminousIntensity> exacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().exacandela, amount: amount);
  static Quantity<LuminousIntensity> zettacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().zettacandela, amount: amount);
  static Quantity<LuminousIntensity> yottacandelas(double amount) =>
      Quantity(unit: LuminousIntensity().yottacandela, amount: amount);

  static Quantity<LuminousIntensity> hefnerKerzes(double amount) =>
      Quantity(unit: LuminousIntensity().hefnerKerze, amount: amount);

  @override
  void defineSystemsOfUnits() {
    _siUnits = InternationalSystemOfUnits<LuminousIntensity>(kind: this);
    candela;

    _hefnerUnits = SystemOfUnits<LuminousIntensity>(kind: this, name: 'Hefner Kerze');
    hefnerKerze;

    systemsOfUnits.addAll([_siUnits, _hefnerUnits]);
  }

  @override
  void loadAllUnits() {
    // SI based:
    decicandela;
    centicandela;
    millicandela;
    microcandela;
    nanocandela;
    picocandela;
    femtocandela;
    attocandela;
    zeptocandela;
    yoctocandela;

    decacandela;
    hectocandela;
    kilocandela;
    megacandela;
    gigacandela;
    teracandela;
    petacandela;
    exacandela;
    zettacandela;
    yottacandela;
  }
}
