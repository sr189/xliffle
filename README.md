# Xliffle
Gem to create a xliff file. Implementing version 1.2 of XLIFF specification: [Xliff-Specification](http://docs.oasis-open.org/xliff/xliff-core/xliff-core.html)

## Warning
This is an very early implementation.

## Installation
Add this line to your Gemfile:

`gem 'xliffle'`


## Usage
### Create a Xliffle instance

```
xliffle = Xliffle.new
=> #<Xliffle::Creator:0x007fea48d31690 @files=[]>
```

### Add file

```
file = xliffle.file('de.po', 'de', 'en')
=> #<Xliffle::File:0x007fea48d4ac08 @strings=[], @original="de.po", @source_locale="de", @target_locale="en">
```

Parameters:

* Original-file
* source locale code
* target locale code

### Add a string to file

```
file.string('admin.foo_bar','Foo', 'Bar')
=> #<Xliffle::String:0x007fea48ea6020 @id="admin.foo_bar", @source="Foo", @target="Bar">
```

Parameters:

* source string
* target string

### Export to file

```xliffle.to_file
=> #<Tempfile:/var/folders/61/2s8jsjln4vg_7tp6bpp0yrg40000gn/T/foo.xlf20140810-19106-11vhjba>
```

Returns temporary xliff-file

### Export to string

```
xliffle.to_xliff
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<xliff version=\"1.2\" xmlns=\"urn:oasis:names:tc:xliff:document:1.2\">\n  <file original=\"de.po\" datatype=\"plaintext\" source-language=\"de\" target-language=\"en\">\n    <body>\n      <trans-unit id=\"admin.foo_bar\">\n        <source>Foo</source>\n        <target>Bar</target>\n      </trans-unit>\n    </body>\n  </file>\n</xliff>\n"
```

Returns xliff structure as string


## Contributors

* Stefan Rohde (@Stefan_Rohde, http://www.rohdenetz.de, info@rohdenetz.de)

## License

MIT License. Copyright Stefan Rohde

