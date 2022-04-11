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

  // SI
  late final Unit<AmountOfSubstance> mole;

  late final Unit<AmountOfSubstance> decimole;
  late final Unit<AmountOfSubstance> centimole;
  late final Unit<AmountOfSubstance> millimole;
  late final Unit<AmountOfSubstance> micromole;
  late final Unit<AmountOfSubstance> nanomole;
  late final Unit<AmountOfSubstance> picomole;
  late final Unit<AmountOfSubstance> femtomole;
  late final Unit<AmountOfSubstance> attomole;
  late final Unit<AmountOfSubstance> zeptomole;
  late final Unit<AmountOfSubstance> yoctomole;

  late final Unit<AmountOfSubstance> decamole;
  late final Unit<AmountOfSubstance> hectomole;
  late final Unit<AmountOfSubstance> kilomole;
  late final Unit<AmountOfSubstance> megamole;
  late final Unit<AmountOfSubstance> gigamole;
  late final Unit<AmountOfSubstance> teramole;
  late final Unit<AmountOfSubstance> petamole;
  late final Unit<AmountOfSubstance> examole;
  late final Unit<AmountOfSubstance> zettamole;
  late final Unit<AmountOfSubstance> yottamole;

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
  void defineUnits() {
    // SI based:
    final si = InternationalSystemOfUnits<AmountOfSubstance>(kind: this);
    mole = si.defineBaseUnit(symbol: 'mol', name: 'mole', factor: 1.0);

    decimole = si.defineUnit(symbol: 'dmol', name: 'decimole', factor: 1e-1);
    centimole = si.defineUnit(symbol: 'cmol', name: 'centimole', factor: 1e-2);
    millimole = si.defineUnit(symbol: 'mmol', name: 'millimole', factor: 1e-3);
    micromole = si.defineUnit(symbol: 'μmol', name: 'micromole', factor: 1e-6);
    nanomole = si.defineUnit(symbol: 'nmol', name: 'nanomole', factor: 1e-9);
    picomole = si.defineUnit(symbol: 'pmol', name: 'picomole', factor: 1e-12);
    femtomole = si.defineUnit(symbol: 'fmol', name: 'femtomole', factor: 1e-15);
    attomole = si.defineUnit(symbol: 'amol', name: 'attomole', factor: 1e-18);
    zeptomole = si.defineUnit(symbol: 'zmol', name: 'zeptomole', factor: 1e-21);
    yoctomole = si.defineUnit(symbol: 'ymol', name: 'yoctomole', factor: 1e-24);

    decamole = si.defineUnit(symbol: 'damol', name: 'decamole', factor: 1e1);
    hectomole = si.defineUnit(symbol: 'hmol', name: 'hectomole', factor: 1e2);
    kilomole = si.defineUnit(symbol: 'kmol', name: 'kilomole', factor: 1e3);
    megamole = si.defineUnit(symbol: 'Mmol', name: 'megamole', factor: 1e6);
    gigamole = si.defineUnit(symbol: 'Gmol', name: 'gigamole', factor: 1e9);
    teramole = si.defineUnit(symbol: 'Tmol', name: 'teramole', factor: 1e12);
    petamole = si.defineUnit(symbol: 'Pmol', name: 'petamole', factor: 1e15);
    examole = si.defineUnit(symbol: 'Emol', name: 'examole', factor: 1e18);
    zettamole = si.defineUnit(symbol: 'Zmol', name: 'zettamole', factor: 1e21);
    yottamole = si.defineUnit(symbol: 'Ymol', name: 'yottamole', factor: 1e24);

    systemsOfUnits.addAll([si]);
  }
}
