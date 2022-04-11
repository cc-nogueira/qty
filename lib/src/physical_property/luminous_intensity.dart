import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../measurement/unit_converter.dart';
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

  // SI
  late final Unit<LuminousIntensity> candela;

  late final Unit<LuminousIntensity> decicandela;
  late final Unit<LuminousIntensity> centicandela;
  late final Unit<LuminousIntensity> millicandela;
  late final Unit<LuminousIntensity> microcandela;
  late final Unit<LuminousIntensity> nanocandela;
  late final Unit<LuminousIntensity> picocandela;
  late final Unit<LuminousIntensity> femtocandela;
  late final Unit<LuminousIntensity> attocandela;
  late final Unit<LuminousIntensity> zeptocandela;
  late final Unit<LuminousIntensity> yoctocandela;

  late final Unit<LuminousIntensity> decacandela;
  late final Unit<LuminousIntensity> hectocandela;
  late final Unit<LuminousIntensity> kilocandela;
  late final Unit<LuminousIntensity> megacandela;
  late final Unit<LuminousIntensity> gigacandela;
  late final Unit<LuminousIntensity> teracandela;
  late final Unit<LuminousIntensity> petacandela;
  late final Unit<LuminousIntensity> exacandela;
  late final Unit<LuminousIntensity> zettacandela;
  late final Unit<LuminousIntensity> yottacandela;

  late final Unit<LuminousIntensity> hefnerKerze;

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
  void defineUnits() {
    // SI based:
    final si = InternationalSystemOfUnits<LuminousIntensity>(kind: this);
    candela = si.defineBaseUnit(symbol: 'cd', name: 'candela', factor: 1.0);

    decicandela = si.defineUnit(symbol: 'dcd', name: 'decicandela', factor: 1e-1);
    centicandela = si.defineUnit(symbol: 'ccd', name: 'centicandela', factor: 1e-2);
    millicandela = si.defineUnit(symbol: 'mcd', name: 'millicandela', factor: 1e-3);
    microcandela = si.defineUnit(symbol: 'μcd', name: 'microcandela', factor: 1e-6);
    nanocandela = si.defineUnit(symbol: 'ncd', name: 'nanocandela', factor: 1e-9);
    picocandela = si.defineUnit(symbol: 'pcd', name: 'picocandela', factor: 1e-12);
    femtocandela = si.defineUnit(symbol: 'fcd', name: 'femtocandela', factor: 1e-15);
    attocandela = si.defineUnit(symbol: 'acd', name: 'attocandela', factor: 1e-18);
    zeptocandela = si.defineUnit(symbol: 'zcd', name: 'zeptocandela', factor: 1e-21);
    yoctocandela = si.defineUnit(symbol: 'ycd', name: 'yoctocandela', factor: 1e-24);

    decacandela = si.defineUnit(symbol: 'dacd', name: 'decacandela', factor: 1e1);
    hectocandela = si.defineUnit(symbol: 'hcd', name: 'hectocandela', factor: 1e2);
    kilocandela = si.defineUnit(symbol: 'kcd', name: 'kilocandela', factor: 1e3);
    megacandela = si.defineUnit(symbol: 'Mcd', name: 'megacandela', factor: 1e6);
    gigacandela = si.defineUnit(symbol: 'Gcd', name: 'gigacandela', factor: 1e9);
    teracandela = si.defineUnit(symbol: 'Tcd', name: 'teracandela', factor: 1e12);
    petacandela = si.defineUnit(symbol: 'Pcd', name: 'petacandela', factor: 1e15);
    exacandela = si.defineUnit(symbol: 'Ecd', name: 'exacandela', factor: 1e18);
    zettacandela = si.defineUnit(symbol: 'Zcd', name: 'zettacandela', factor: 1e21);
    yottacandela = si.defineUnit(symbol: 'Ycd', name: 'yottacandela', factor: 1e24);

    final hefner = SystemOfUnits(
        kind: this,
        name: 'Hefner Kerze',
        unitConverter: PowerOfTenUnitConverter<LuminousIntensity>());

    hefnerKerze = hefner.defineBaseUnit(symbol: 'HK', name: 'hefnerkerze', factor: 0.903);

    systemsOfUnits.addAll([si, hefner]);
  }
}
