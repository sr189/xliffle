# frozen_string_literal: true

require 'spec_helper'
require 'oga'

RSpec.describe Xliffle::Note do
  let(:note_text) { 'This is a note.' }
  let(:xml) { Builder::XmlMarkup.new(indent: 0) }

  context 'default priority' do
    let(:note) { Xliffle::Note.new(note_text) }

    it 'defaults priority to 2' do
      expect(note.priority).to eq(2)
    end

    it 'outputs note text' do
      expect(Oga.parse_xml(note.to_xliff(xml)).xpath('string(note)')).to eq(note_text)
    end

    it 'outputs default priority attribute' do
      expect(Oga.parse_xml(note.to_xliff(xml)).xpath('string(note/@priority)')).to eq('2')
    end
  end

  context 'custom priority' do
    let(:note) { Xliffle::Note.new(note_text, priority: 1) }

    it 'sets priority' do
      expect(note.priority).to eq(1)
    end

    it 'outputs custom priority attribute' do
      expect(Oga.parse_xml(note.to_xliff(xml)).xpath('string(note/@priority)')).to eq('1')
    end
  end
end
