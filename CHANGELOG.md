<a name="0.3.1"></a>
### 0.3.1 (2021-05-17)

#### Maintain

* be less precise with the required ruby version	 ([433cbc9](/../commit/433cbc9))
* update dependencies and add rubocop	 ([2e1bd97](/../commit/2e1bd97))

<a name="0.3.0"></a>
### 0.3.0

#### Features
* Adds option to wrap content of a string in a CDATA section

#### Maintain
* Updates dependencies
* Introduces Rubocop

<a name="0.2.2"></a>
### 0.2.2

#### Fixes

* Fixed a bug were a note was added to a string without priority ("no implicit conversion of Symbol into Integer")

<a name="0.2.0"></a>
### 0.2.0 (2014-12-21)

#### Breaking Changes

* Uses id-attribute of a trans-unit as main identifier (was resname-attribute before)
* The resname-attribute of a trans-unit can be set by adding the optional attribute `resource_name` to the options-hash when adding a string

#### Documentation

* Changed wrong method-name from `.to_string` to `.to_xliff` in README

#### Features

* Introducing a Changelog
* Introducing basic specs for Xliffle::String and Xliffle::File
