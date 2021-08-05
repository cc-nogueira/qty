# Physical Quantities and Unit Conversions

This package defines units of measurement and quantities with an API for quantities operations and unit conversions.

The core concepts are `PhysicalProperty`, `SystemOfMeasurent`, `Unit` and `Quantity`, explained at the bottom of this README.

Defines most common units for **Mass**, **Length**, **Volume** and **Time** quantities.

## Using Quantities

Static methods offer a very convenient API to create quantities. Note that the `+` operation returns a new quantity using the first operand unit,
this the order of the operands is significant when they have different units:
```dart
final raceStart = Length.kilometers(amount: 12.5);
final raceLength = Length.miles(amount: 1 / 4.0);
print('Finish line at ${raceStart + raceLength} from here');
print('Finish line at ${raceLength + raceStart} from here');
```

Will output:
```dart
'Finish line at 12.902336 km from here'
'Finish line at 8.017139902966674 mi from here'
```

You have a number of operations available for quantities, including unit conversions:
```dart
final myWeight = Mass.kilograms(amount: 64.0);
final herWeight = Mass.kilograms(amount: 53.0);
final herWeightInPounds = herWeight.convertTo(Mass.lb);
print('Twice my weight is ${myWeight * 2}');
print('Our weight together is ${myWeight + herWeight}');
print('Her weight in England would be $herWeightInPounds');
print('approximately ${herWeightInPounds.print(useName: true, fractionDigits: 2)}');
```

Will output:
```dart
'Twice my weight is 128.0 kg'
'Our weight together is 117.0 kg'
'Her weight in England would be 116.84499895798511 lb'
'approximately 116.84 pounds'
```

Precision is best within the same system of measurement:
```dart
final galons = Volume.galons(amount: 12.0);
print('Volume of $galons is equivalent to ${galons.convertTo(Volume.qt)}');
print('Volume of $galons is also the same ${galons.convertTo(Volume.l)}');
```

Will output:
```dart
'Volume of 12.0 gal is equivalent to 48.0 qt'
'Volume of 12.0 gal is also the same 54.55308000000001 l'
```

## Concepts

All concepts are interchained to model our understanding of units and measurements, as follows:

### ***PhysicalProperty***

The main concept is **`PhysicalProperty`**, also called **kind** throughout this package, it is a quantifiable physical property by an amount of an `Unit` that is part one of its `SystemOfMeasurents`.

`PhysicalProperty` is implemented as an abstract class extended by each especific property, such as `Mass` and `Length`. All instances in this hierarchy are implemented as Singletons with many static shortcuts to the respective singleton instance property.

It offers two main properties: ***baseUnit*** and ***units*** but both are actually stored in `SystemOfMeasurements` instances, thus this class is more like a coordinator of its system of measurements all created at its single instance construction.

### ***SystemOfMeasurement***

**`SystemOfMeasurement`** is a system of `Units` for a certain `PhysicalProperty`, such as `InternationalSystemOfUnits` or `ImperialSystemOfUnits`.

It defines a ***baseUnit***, a list of contained ***units*** and a especific `UnitConverter` to convert amounts from one of its units to another of its units. Since all units are of the same system, this conversion can be efficient and precise, for example `InternationalSystemOfUnits` use a `PowerOfTenUnitConverter` while `ImperialSystemOfUnits` use a `LinearUnitConverter`.

`SystemOfMeasurement` also implements quantity conversion between different system of units, such as from ***meters*** to ***inches*** with inter system conversion by means of baseUnits conversion factors.

### ***Unit***

**`Unit`** has symbol and name and belongs to a `SystemOfMeasurement` and it knows it. This way we can ask an unit for a `QuantityConverter` function to convert amounts from this unit to another one of the same kind, such quantity converter could then be used for a series of conversions from the same two units.

### ***Quantity***

**`Quantity`** is a container class of ***Unit*** and ***Amount***. It is a comparable class with intrinsic unit conversion and offers an API for 
quantities operations (+, -, *, /, negated, etc).
