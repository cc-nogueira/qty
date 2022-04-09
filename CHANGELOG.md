# Quantities representation and unit conversions

## 0.7.0
Simplified the use of SystemOfUnits removing Imperial and Nautical subclasses.
Revised all PhysycalProperties adding various new unit definitions.
Volume units for both US and UK versions.
Renamed Compound to Derived units.

## 0.6.0
Large refactoring.
Removed classes representing LinearConvertible variants. Code moved to superclass that is now "Linear".
Simplified all PhysicalProperties subclasses API to its units (in Length, Mass, etc).
Revised all unit names inside PhysicalProperties subclasses.

## 0.5.0
Introduction of generics to define the kind of Unit and kind of Quantity,
such as in `Unit<Mass>` or `Quantity<Length>`.

## 0.4.2
Fix CompoundUnits constructors to maintain original PhysicalProperty reference.

## 0.4.1
Removed all exports but qty/qty.dart 
Fix missing exports post last refactoring.

## 0.4.0
Introduction of Temperature quantities
Suport for the 4 known units (Kelvin, Celcius, Fahrenheit and Rankine).
Some class realocation in a better file structure.

## 0.3.0
Introduction of CompoundUnit and CompoundPhysicalProperty.  
Refactoring existing measurements to inherit and use new LinearConvertibleSystemOfUnits and LinearConvertibleUnit.  
Speed quantities.  

## 0.2.1
README.md updates.  

## 0.2.0
ImperialSystemOfUnits static constructor in Length, Mass and Volume.  
Quantity print method to set unitName and fractionDigits format.  
README.md updates.  

## 0.1.4
Github account renamed.  

## 0.1.3
Time quantities.  
InternationalSystemOfUnits with optional LinearUnitConverter to replace PowerOfTenUnitConverter.  

## 0.1.2
Formatting (dartfmt).  
Documentation.  
SystemOfMeasurement.baseUnit made final (late final).  

## 0.1.1
Length quantities.  
Misspelling fixes.  
Better mass usage example.  

## 0.1.0
Initial version with Dimensionless, Mass and Volume quantities.  