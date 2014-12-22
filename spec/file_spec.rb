require 'spec_helper'
require 'oga'

describe Xliffle::File do
  let(:source_locale) { 'de' }
  let(:target_locale) { 'en' }
  let(:original) { 'original.file' }

  let(:xml) { Builder::XmlMarkup.new( :indent => 2 ) }
  let(:file) { Xliffle::File.new(original, source_locale, target_locale) }
  let(:xliff) { file.to_xliff(xml) }
  let(:xml_document) { Oga.parse_xml(xliff) }

  it "should set correct original attribute" do
    expect(xml_document.xpath('string(file/@original)')).to eq(original)
  end

  it "should set correct source-language-attribute" do
    expect(xml_document.xpath('string(file/@source-language)')).to eq(source_locale)
  end

  it "should set correct target-language-attribute" do
    expect(xml_document.xpath('string(file/@target-language)')).to eq(target_locale)
  end

  context :add_string do
    it "should add correct number of strings" do
      file.string('admin.foo_bar','Foo', 'Bar')
      xml_document = Oga.parse_xml( file.to_xliff(xml) )

      expect(xml_document.xpath('//file/body/trans-unit').count).to eq(1)
    end

    it "should add correct number of strings" do
      file.string('admin.foo_bar','Foo', 'Bar')
      file.string('admin.bar_foo','Bar', 'Foo')
      xml_document = Oga.parse_xml( file.to_xliff(xml) )

      expect(xml_document.xpath('//file/body/trans-unit').count).to eq(2)
    end
  end
end
