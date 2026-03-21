# frozen_string_literal: true

require 'spec_helper'
require 'oga'

RSpec.describe Xliffle::Creator do
  let(:creator) { Xliffle::Creator.new }

  it 'starts with no files' do
    expect(creator.files).to be_empty
  end

  describe '#file' do
    it 'adds a file and returns it' do
      file = creator.file('app.strings', 'en', 'de')
      expect(creator.files).to contain_exactly(file)
    end

    it 'adds multiple files' do
      creator.file('app.strings', 'en', 'de')
      creator.file('other.strings', 'en', 'fr')
      expect(creator.files.count).to eq(2)
    end
  end

  describe '#to_xliff' do
    let(:xliff) { creator.to_xliff }
    let(:xml_document) { Oga.parse_xml(xliff) }

    it 'outputs an XML declaration' do
      expect(xliff).to start_with('<?xml version="1.0" encoding="UTF-8"?>')
    end

    it 'outputs a root xliff element with version 1.2' do
      expect(xml_document.xpath('string(xliff/@version)')).to eq('1.2')
    end

    it 'outputs the correct XLIFF namespace' do
      expect(xml_document.xpath('string(xliff/@xmlns)')).to eq('urn:oasis:names:tc:xliff:document:1.2')
    end

    it 'includes all files in output' do
      creator.file('app.strings', 'en', 'de')
      creator.file('other.strings', 'en', 'fr')
      expect(Oga.parse_xml(creator.to_xliff).xpath('//file').count).to eq(2)
    end
  end

  describe '#to_file' do
    it 'returns a Tempfile with xliff content' do
      creator.file('app.strings', 'en', 'de')
      tmpfile = creator.to_file
      expect(File.read(tmpfile.path)).to eq(creator.to_xliff)
    end

    it 'returns a file with .xlf extension' do
      tmpfile = creator.to_file
      expect(tmpfile.path).to end_with('.xlf')
    end
  end
end
