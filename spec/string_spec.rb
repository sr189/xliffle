require 'spec_helper'
require 'oga'

describe Xliffle::String do

  let(:id) { 'Foobar' }
  let(:source) { 'Foo' }
  let(:target) { 'Bar' }
  let(:resource_name) { 'resource.name' }
  let(:xml) { Builder::XmlMarkup.new( :indent => 2 ) }
  let(:xliff) { Xliffle::String.new(id, source, target).to_xliff(xml) }
  let(:xml_document) { Oga.parse_xml(xliff) }

  it "should output correct id element" do
    expect(xml_document.xpath('string(trans-unit/@id)')).to eq(id)
  end

  it "should output correct source element" do
    expect(xml_document.xpath('string(trans-unit/source)')).to eq(source)
  end

  it "should output correct target element" do
    expect(xml_document.xpath('string(trans-unit/target)')).to eq(target)
  end

  it "should not set resname if resource_name is not set" do
    expect(xml_document.xpath('string(trans-unit/@resname)')).to eq("")
  end

  it "should set resname-attribute if resource_name is set" do
    xliff = Xliffle::String.new(id, source, target, { resource_name: resource_name }).to_xliff(xml)
    expect(Oga.parse_xml(xliff).xpath('string(trans-unit/@resname)')).to eq(resource_name)
  end
end
