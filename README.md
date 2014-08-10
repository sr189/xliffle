# Xliffle
Gem to create an xliff file.

Implementing version 1.2 of XLIFF specification: [Xliff-Specification](http://docs.oasis-open.org/xliff/xliff-core/xliff-core.html)

## Warning
This is an very early implementation.

## Installation
Add this line to your Gemfile:

`gem 'xliffle', :git => "git://github.com/sr189/xliffle.git"`


## Usage
### Create an Xliffle instance

`builder = Xliffle::Creator.new`

### Add a file

`file = builder.file('de.po', 'de', 'en')`

Parameters:

* Original-file
* source locale code
* target locale code

### Add a string to a file

`file.string('Foo', 'Bar')`

Parameters:

* source string
* target string

### Create a Xliff file

`builder.to_file`

Returns temporary xliff-file

### Create a Xliff string

`builder.to_xliff`

Returns xliff structure as string


## Contributors

* Stefan Rohde (@Stefan_Rohde, http://www.rohdenetz.de, info@rohdenetz.de)

## License

MIT License. Copyright Stefan Rohde

