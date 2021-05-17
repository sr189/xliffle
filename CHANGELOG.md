## 0.3.0
Features:
+ Adds option to wrap content of a string in a CDATA section

Maintenance:
+ Updates dependencies
+ Introduces Rubocop

## 0.2.2
Bugs:

+ Fixed a bug were a note was added to a string without priority ("no implicit conversion of Symbol into Integer")

## 0.2.0 (December 21, 2014)

Breaking Changes:

+ Uses id-attribute of a trans-unit as main identifier (was resname-attribute before)
+ The resname-attribute of a trans-unit can be set by adding the optional attribute `resource_name` to the options-hash when adding a string

Documentation:

+ Changed wrong method-name from `.to_string` to `.to_xliff` in README

Features:

+ Introducing a Changelog
+ Introducing basic specs for Xliffle::String and Xliffle::File
