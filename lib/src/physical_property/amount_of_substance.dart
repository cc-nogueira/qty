import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Amount of Substance physical property singleton.
///
/// Configures Internation System of Units (SI) units defining its [AmountOfSubstance] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class AmountOfSubstance extends PhysicalProperty<AmountOfSubstance> {
  factory AmountOfSubstance() => _instance ??= AmountOfSubstance._();
  AmountOfSubstance._()
      : super(kind: 'amount of substance', dimensionSymbol: 'N', quantitySymbol: 'n');

  static AmountOfSubstance? _instance;

  static const avogadroNumber = 6.02214076e23;

  late InternationalSystemOfUnits<AmountOfSubstance> _siUnits;

  // SI
  late final mole = _siUnits.defineBaseUnit(symbol: 'mol', name: 'mole', factor: 1.0);

  late final decimole = _siUnits.defineUnit(symbol: 'dmol', name: 'decimole', factor: 1e-1);
  late final centimole = _siUnits.defineUnit(symbol: 'cmol', name: 'centimole', factor: 1e-2);
  late final millimole = _siUnits.defineUnit(symbol: 'mmol', name: 'millimole', factor: 1e-3);
  late final micromole = _siUnits.defineUnit(symbol: 'μmol', name: 'micromole', factor: 1e-6);
  late final nanomole = _siUnits.defineUnit(symbol: 'nmol', name: 'nanomole', factor: 1e-9);
  late final picomole = _siUnits.defineUnit(symbol: 'pmol', name: 'picomole', factor: 1e-12);
  late final femtomole = _siUnits.defineUnit(symbol: 'fmol', name: 'femtomole', factor: 1e-15);
  late final attomole = _siUnits.defineUnit(symbol: 'amol', name: 'attomole', factor: 1e-18);
  late final zeptomole = _siUnits.defineUnit(symbol: 'zmol', name: 'zeptomole', factor: 1e-21);
  late final yoctomole = _siUnits.defineUnit(symbol: 'ymol', name: 'yoctomole', factor: 1e-24);

  late final decamole = _siUnits.defineUnit(symbol: 'damol', name: 'decamole', factor: 1e1);
  late final hectomole = _siUnits.defineUnit(symbol: 'hmol', name: 'hectomole', factor: 1e2);
  late final kilomole = _siUnits.defineUnit(symbol: 'kmol', name: 'kilomole', factor: 1e3);
  late final megamole = _siUnits.defineUnit(symbol: 'Mmol', name: 'megamole', factor: 1e6);
  late final gigamole = _siUnits.defineUnit(symbol: 'Gmol', name: 'gigamole', factor: 1e9);
  late final teramole = _siUnits.defineUnit(symbol: 'Tmol', name: 'teramole', factor: 1e12);
  late final petamole = _siUnits.defineUnit(symbol: 'Pmol', name: 'petamole', factor: 1e15);
  late final examole = _siUnits.defineUnit(symbol: 'Emol', name: 'examole', factor: 1e18);
  late final zettamole = _siUnits.defineUnit(symbol: 'Zmol', name: 'zettamole', factor: 1e21);
  late final yottamole = _siUnits.defineUnit(symbol: 'Ymol', name: 'yottamole', factor: 1e24);

  // SI
  static Quantity<AmountOfSubstance> moles(double amount) =>
      Quantity(unit: AmountOfSubstance().mole, amount: amount);

  static Quantity<AmountOfSubstance> decimoles(double amount) =>
      Quantity(unit: AmountOfSubstance().decimole, amount: amount);
  static Quantity<AmountOfSubstance> centimoles(double amount) =>
      Quantity(unit: AmountOfSubstance().centimole, amount: amount);
  static Quantity<AmountOfSubstance> millimoles(double amount) =>
      Quantity(unit: AmountOfSubstance().millimole, amount: amount);
  static Quantity<AmountOfSubstance> micromoles(double amount) =>
      Quantity(unit: AmountOfSubstance().micromole, amount: amount);
  static Quantity<AmountOfSubstance> nanomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().nanomole, amount: amount);
  static Quantity<AmountOfSubstance> picomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().picomole, amount: amount);
  static Quantity<AmountOfSubstance> femtomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().femtomole, amount: amount);
  static Quantity<AmountOfSubstance> attomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().attomole, amount: amount);
  static Quantity<AmountOfSubstance> zeptomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().zeptomole, amount: amount);
  static Quantity<AmountOfSubstance> yoctomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().yoctomole, amount: amount);

  static Quantity<AmountOfSubstance> decamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().decamole, amount: amount);
  static Quantity<AmountOfSubstance> hectomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().hectomole, amount: amount);
  static Quantity<AmountOfSubstance> kilomoles(double amount) =>
      Quantity(unit: AmountOfSubstance().kilomole, amount: amount);
  static Quantity<AmountOfSubstance> megamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().megamole, amount: amount);
  static Quantity<AmountOfSubstance> gigamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().gigamole, amount: amount);
  static Quantity<AmountOfSubstance> teramoles(double amount) =>
      Quantity(unit: AmountOfSubstance().teramole, amount: amount);
  static Quantity<AmountOfSubstance> petamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().petamole, amount: amount);
  static Quantity<AmountOfSubstance> examoles(double amount) =>
      Quantity(unit: AmountOfSubstance().examole, amount: amount);
  static Quantity<AmountOfSubstance> zettamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().zettamole, amount: amount);
  static Quantity<AmountOfSubstance> yottamoles(double amount) =>
      Quantity(unit: AmountOfSubstance().yottamole, amount: amount);

  @override
  void defineSystemsOfUnits() {
    // SI based:
    _siUnits = InternationalSystemOfUnits<AmountOfSubstance>(kind: this);
    mole;

    systemsOfUnits.addAll([_siUnits]);
  }

  @override
  void loadAllUnits() {
    decimole;
    centimole;
    millimole;
    micromole;
    nanomole;
    picomole;
    femtomole;
    attomole;
    zeptomole;
    yoctomole;

    decamole;
    hectomole;
    kilomole;
    megamole;
    gigamole;
    teramole;
    petamole;
    examole;
    zettamole;
    yottamole;
  }
}
