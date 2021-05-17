# frozen_string_literal: true

require 'pry'
require 'spec_helper'
require 'oga'

# rubocop:disable Metrics/BlockLength
describe Xliffle::String do
  let(:id) { 'Foobar' }
  let(:source) { 'Foo' }
  let(:target) { 'Bar' }

  let(:xml) { Builder::XmlMarkup.new(indent: 0) }
  let(:string) { Xliffle::String.new(id, source, target) }
  let(:xml_document) { Oga.parse_xml(string.to_xliff(xml)) }

  context 'general trans-units' do
    it 'should output correct id element' do
      expect(xml_document.xpath('string(trans-unit/@id)')).to eq(id)
    end

    it 'should output correct source element' do
      expect(xml_document.xpath('string(trans-unit/source)')).to eq(source)
    end

    it 'should output correct target element' do
      expect(xml_document.xpath('string(trans-unit/target)')).to eq(target)
    end
  end

  context 'notes' do
    let(:note) { 'This is a test comment.' }

    it 'should output correct note' do
      string.note(note, { priority: 1 })
      expect(Oga.parse_xml(string.to_xliff(xml)).xpath('string(trans-unit/note)')).to eq(note)
    end

    it 'should use default priority of 2' do
      string.note(note)
      expect(Oga.parse_xml(string.to_xliff(xml)).xpath('string(trans-unit/note/@priority)')).to eq('2')
    end
  end

  context 'resource names' do
    let(:resource_name) { 'resource.name' }

    it 'should not set resname if resource_name is not set' do
      expect(xml_document.xpath('string(trans-unit/@resname)')).to eq('')
    end

    it 'should set resname-attribute if resource_name is set' do
      xliff = Xliffle::String.new(id, source, target, { resource_name: resource_name }).to_xliff(xml)
      expect(Oga.parse_xml(xliff).xpath('string(trans-unit/@resname)')).to eq(resource_name)
    end
  end

  context 'use cdata' do
    it 'should use cdata instead of text' do
      xliff = Xliffle::String.new(id, source, target, { use_cdata: true }).to_xliff(xml)

      expect(xliff).to eq(
        '<trans-unit id="Foobar"><source><![CDATA[Foo]]></source><target><![CDATA[Bar]]></target></trans-unit>'
      )
    end
  end

  context 'empty source segment' do
    it 'should use cdata instead of text' do
      xliff = Xliffle::String.new(id, nil, target).to_xliff(xml)

      expect(xliff).to eq(
        '<trans-unit id="Foobar"><source/><target>Bar</target></trans-unit>'
      )
    end
  end

  context 'empty target segment' do
    it 'should use cdata instead of text' do
      xliff = Xliffle::String.new(id, source, nil).to_xliff(xml)

      expect(xliff).to eq(
        '<trans-unit id="Foobar"><source>Foo</source><target/></trans-unit>'
      )
    end
  end
end
# rubocop:enable Metrics/BlockLength
