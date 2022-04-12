import '../measurement/physical_property.dart';
import '../measurement/systems_of_units.dart';
import '../measurement/unit.dart';
import '../quantity/quantity.dart';

/// Electrical Current physical property singleton.
///
/// Configures Internation System of Units (SI) units defining its [ElectricalCurrent] [Unit] instances.
/// All units are accessible by singleton instance method or by symbol.
/// Also provides Quantity constructors for all units.
class ElectricalCurrent extends PhysicalProperty<ElectricalCurrent> {
  factory ElectricalCurrent() => _instance ??= ElectricalCurrent._();
  ElectricalCurrent._()
      : super(kind: 'electrical current', dimensionSymbol: 'I', quantitySymbol: 'I');

  static ElectricalCurrent? _instance;

  late final InternationalSystemOfUnits<ElectricalCurrent> _siUnits;

  // SI
  late final ampere = _siUnits.defineBaseUnit(symbol: 'A', name: 'ampere', factor: 1.0);

  late final deciampere = _siUnits.defineUnit(symbol: 'dA', name: 'deciampere', factor: 1e-1);
  late final centiampere = _siUnits.defineUnit(symbol: 'cA', name: 'centiampere', factor: 1e-2);
  late final milliampere = _siUnits.defineUnit(symbol: 'mA', name: 'milliampere', factor: 1e-3);
  late final microampere = _siUnits.defineUnit(symbol: 'μA', name: 'microampere', factor: 1e-6);
  late final nanoampere = _siUnits.defineUnit(symbol: 'nA', name: 'nanoampere', factor: 1e-9);
  late final picoampere = _siUnits.defineUnit(symbol: 'pA', name: 'picoampere', factor: 1e-12);
  late final femtoampere = _siUnits.defineUnit(symbol: 'fA', name: 'femtoampere', factor: 1e-15);
  late final attoampere = _siUnits.defineUnit(symbol: 'aA', name: 'attoampere', factor: 1e-18);
  late final zeptoampere = _siUnits.defineUnit(symbol: 'zA', name: 'zeptoampere', factor: 1e-21);
  late final yoctoampere = _siUnits.defineUnit(symbol: 'yA', name: 'yoctoampere', factor: 1e-24);

  late final decaampere = _siUnits.defineUnit(symbol: 'daA', name: 'decaampere', factor: 1e1);
  late final hectoampere = _siUnits.defineUnit(symbol: 'hA', name: 'hectoampere', factor: 1e2);
  late final kiloampere = _siUnits.defineUnit(symbol: 'kA', name: 'kiloampere', factor: 1e3);
  late final megaampere = _siUnits.defineUnit(symbol: 'MA', name: 'megaampere', factor: 1e6);
  late final gigaampere = _siUnits.defineUnit(symbol: 'GA', name: 'gigaampere', factor: 1e9);
  late final teraampere = _siUnits.defineUnit(symbol: 'TA', name: 'teraampere', factor: 1e12);
  late final petaampere = _siUnits.defineUnit(symbol: 'PA', name: 'petaampere', factor: 1e15);
  late final exaampere = _siUnits.defineUnit(symbol: 'EA', name: 'exaampere', factor: 1e18);
  late final zettaampere = _siUnits.defineUnit(symbol: 'ZA', name: 'zettaampere', factor: 1e21);
  late final yottaampere = _siUnits.defineUnit(symbol: 'YA', name: 'yottaampere', factor: 1e24);

  // SI
  static Quantity<ElectricalCurrent> amperes(double amount) =>
      Quantity(unit: ElectricalCurrent().ampere, amount: amount);

  static Quantity<ElectricalCurrent> deciamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().deciampere, amount: amount);
  static Quantity<ElectricalCurrent> centiamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().centiampere, amount: amount);
  static Quantity<ElectricalCurrent> milliamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().milliampere, amount: amount);
  static Quantity<ElectricalCurrent> microamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().microampere, amount: amount);
  static Quantity<ElectricalCurrent> nanoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().nanoampere, amount: amount);
  static Quantity<ElectricalCurrent> picoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().picoampere, amount: amount);
  static Quantity<ElectricalCurrent> femtoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().femtoampere, amount: amount);
  static Quantity<ElectricalCurrent> attoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().attoampere, amount: amount);
  static Quantity<ElectricalCurrent> zeptoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().zeptoampere, amount: amount);
  static Quantity<ElectricalCurrent> yoctoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().yoctoampere, amount: amount);

  static Quantity<ElectricalCurrent> decaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().decaampere, amount: amount);
  static Quantity<ElectricalCurrent> hectoamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().hectoampere, amount: amount);
  static Quantity<ElectricalCurrent> kiloamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().kiloampere, amount: amount);
  static Quantity<ElectricalCurrent> megaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().megaampere, amount: amount);
  static Quantity<ElectricalCurrent> gigaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().gigaampere, amount: amount);
  static Quantity<ElectricalCurrent> teraamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().teraampere, amount: amount);
  static Quantity<ElectricalCurrent> petaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().petaampere, amount: amount);
  static Quantity<ElectricalCurrent> exaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().exaampere, amount: amount);
  static Quantity<ElectricalCurrent> zettaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().zettaampere, amount: amount);
  static Quantity<ElectricalCurrent> yottaamperes(double amount) =>
      Quantity(unit: ElectricalCurrent().yottaampere, amount: amount);

  @override
  void defineSystemsOfUnits() {
    _siUnits = InternationalSystemOfUnits<ElectricalCurrent>(kind: this);
    ampere;

    systemsOfUnits.addAll([_siUnits]);
  }

  @override
  void loadAllUnits() {
    deciampere;
    centiampere;
    milliampere;
    microampere;
    nanoampere;
    picoampere;
    femtoampere;
    attoampere;
    zeptoampere;
    yoctoampere;

    decaampere;
    hectoampere;
    kiloampere;
    megaampere;
    gigaampere;
    teraampere;
    petaampere;
    exaampere;
    zettaampere;
    yottaampere;
  }
}
