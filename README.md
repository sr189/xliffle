# Xliffle
A Gem to create xliff files from translated strings. Implementing version 1.2 of XLIFF specification: [Xliff-Specification](http://docs.oasis-open.org/xliff/xliff-core/xliff-core.html)

## Warning
This is still an early implementation.

## Installation
Add this line to your Gemfile:

`gem 'xliffle'`


## Usage
### Create a Xliffle instance

#### Example####

```
xliffle = Xliffle.new
=> #<Xliffle::Creator:0x007fea48d31690 @files=[]>
```

### Add a file to Xliffle instance

**xliffle.file**(filename, source_locale_code, target_locale_code)

#### Example ####
```
file = xliffle.file('de.po', 'de', 'en')
=> #<Xliffle::File...>
```

### Add a string to file instance

**file.string**(name, source_string, target_string, options={})

#### Example ####

```
string = file.string('admin.foo_bar','Foo', 'Bar')
# => #<Xliffle::String...>
```

#### Options

The options-hash may take the following optional attributes

* resource_name

###### Example with optional resource_name

```
second_string = file.string('user.bar_foo','Bar', 'Foo', { resource_name: 'foo.bar.header' })
# => #<Xliffle::String...>
```



### Add a note to string instance
Xliffle supports Xliff localization notes (as structural elements).

**string.note**(note, options = {})

#### Options ####

* *:priority* - Sets the priority of the note (default: 2)

#### Example ####

```
string.note('This is localization comment', prioirity: 2)
#=> #<Xliffle::Note...>
```


### Export to file

**to_xliff()**

Returns xliff-file

#### Example ####
```
xliffle.to_file
# => #<Tempfile...>
```

### Export to Xliff string

Exports XML-markup to a string

**to_xliff()**
#### Example ####

```
xliffle.to_xliff
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<xliff version=\"1.2\" xmlns=\"urn:oasis:names:tc:xliff:document:1.2\">\n  <file original=\"de.po\" datatype=\"plaintext\" source-language=\"de\" target-language=\"en\">\n    <body>\n      <trans-unit id=\"admin.foo_bar\">\n        <source>Foo</source>\n        <target>Bar</target>\n        <note priority=\"2\">This is localization comment</note>\n      </trans-unit>\n      <trans-unit id=\"user.bar_foo\" resname=\"foo.bar.header\">\n        <source>Bar</source>\n        <target>Foo</target>\n      </trans-unit>\n    </body>\n  </file>\n</xliff>\n"
```

##### Rendered Example Output

```
<?xml version="1.0" encoding="UTF-8"?>
<xliff version="1.2" xmlns="urn:oasis:names:tc:xliff:document:1.2">
    <file original="de.po" datatype="plaintext" source-language="de" target-language="en">
        <body>
            <trans-unit id="admin.foo_bar">
                <source>Foo</source>
                <target>Bar</target>
                <note priority="2">This is localization comment</note>            
            </trans-unit>
            <trans-unit id="user.bar_foo" resname="foo.bar.header">
                <source>Bar</source>
                <target>Foo</target>
            </trans-unit>
        </body>
    </file>
</xliff>
```


## Contributors

* Stefan Rohde (@Stefan_Rohde, http://www.rohdenetz.de, info@rohdenetz.de)

## Thanks to

* Toptranslation GmbH, Hamburg - my work, my team, my beloved hobby - @toptranslation, https://www.toptranslation.com
    
## License

MIT License. Copyright Stefan Rohde

