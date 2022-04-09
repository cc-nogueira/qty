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
  ElectricalCurrent._() : super(kind: 'electrical current', symbol: 'I');

  static ElectricalCurrent? _instance;

  // SI
  late final Unit<ElectricalCurrent> ampere;

  late final Unit<ElectricalCurrent> deciampere;
  late final Unit<ElectricalCurrent> centiampere;
  late final Unit<ElectricalCurrent> milliampere;
  late final Unit<ElectricalCurrent> microampere;
  late final Unit<ElectricalCurrent> nanoampere;
  late final Unit<ElectricalCurrent> picoampere;
  late final Unit<ElectricalCurrent> femtoampere;
  late final Unit<ElectricalCurrent> attoampere;
  late final Unit<ElectricalCurrent> zeptoampere;
  late final Unit<ElectricalCurrent> yoctoampere;

  late final Unit<ElectricalCurrent> decaampere;
  late final Unit<ElectricalCurrent> hectoampere;
  late final Unit<ElectricalCurrent> kiloampere;
  late final Unit<ElectricalCurrent> megaampere;
  late final Unit<ElectricalCurrent> gigaampere;
  late final Unit<ElectricalCurrent> teraampere;
  late final Unit<ElectricalCurrent> petaampere;
  late final Unit<ElectricalCurrent> exaampere;
  late final Unit<ElectricalCurrent> zettaampere;
  late final Unit<ElectricalCurrent> yottaampere;

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
  void defineUnits() {
    // SI based:
    final si = InternationalSystemOfUnits<ElectricalCurrent>(kind: this);
    ampere = si.defineBaseUnit(symbol: 'A', name: 'ampere', factor: 1.0);

    deciampere = si.defineUnit(symbol: 'dA', name: 'deciampere', factor: 1e-1);
    centiampere = si.defineUnit(symbol: 'cA', name: 'centiampere', factor: 1e-2);
    milliampere = si.defineUnit(symbol: 'mA', name: 'milliampere', factor: 1e-3);
    microampere = si.defineUnit(symbol: 'μA', name: 'microampere', factor: 1e-6);
    nanoampere = si.defineUnit(symbol: 'nA', name: 'nanoampere', factor: 1e-9);
    picoampere = si.defineUnit(symbol: 'pA', name: 'picoampere', factor: 1e-12);
    femtoampere = si.defineUnit(symbol: 'fA', name: 'femtoampere', factor: 1e-15);
    attoampere = si.defineUnit(symbol: 'aA', name: 'attoampere', factor: 1e-18);
    zeptoampere = si.defineUnit(symbol: 'zA', name: 'zeptoampere', factor: 1e-21);
    yoctoampere = si.defineUnit(symbol: 'yA', name: 'yoctoampere', factor: 1e-24);

    decaampere = si.defineUnit(symbol: 'daA', name: 'decaampere', factor: 1e1);
    hectoampere = si.defineUnit(symbol: 'hA', name: 'hectoampere', factor: 1e2);
    kiloampere = si.defineUnit(symbol: 'kA', name: 'kiloampere', factor: 1e3);
    megaampere = si.defineUnit(symbol: 'MA', name: 'megaampere', factor: 1e6);
    gigaampere = si.defineUnit(symbol: 'GA', name: 'gigaampere', factor: 1e9);
    teraampere = si.defineUnit(symbol: 'TA', name: 'teraampere', factor: 1e12);
    petaampere = si.defineUnit(symbol: 'PA', name: 'petaampere', factor: 1e15);
    exaampere = si.defineUnit(symbol: 'EA', name: 'exaampere', factor: 1e18);
    zettaampere = si.defineUnit(symbol: 'ZA', name: 'zettaampere', factor: 1e21);
    yottaampere = si.defineUnit(symbol: 'YA', name: 'yottaampere', factor: 1e24);

    systemsOfUnits.addAll([si]);
  }
}
