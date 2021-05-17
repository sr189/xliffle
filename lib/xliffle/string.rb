# frozen_string_literal: true

module Xliffle
  class String
    attr_reader :id, :source, :target, :notes

    def initialize(id, source_string, target_string, options = {})
      @id = id
      @source_string = source_string
      @target_string = target_string
      @options = options
      @notes = []
    end

    def note(note, priority = 2)
      note = Xliffle::Note.new(note, priority: priority)
      @notes << note
      note
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', attributes) do |tag|
        tag.source do |tag|
          segment(tag, @source_string)
        end

        tag.target do |tag|
          segment(tag, @target_string)
        end

        @notes.each do |note|
          note.to_xliff(tag)
        end
      end
    end

    private

    def attributes
      attributes = { id: @id }
      attributes[:resname] = @options[:resource_name] if @options[:resource_name]

      attributes
    end

    def segment(tag, value)
      if @options[:use_cdata]
        tag.cdata!(value)
      else
        tag.text!(value)
      end
    end
  end
end
