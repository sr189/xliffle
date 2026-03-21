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
      note = Xliffle::Note.new(note, priority:)
      @notes << note
      note
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', attributes) do |tag|
        add_source_segment(tag)
        add_target_segment(tag)

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

    def add_source_segment(tag)
      return tag.source unless @source_string

      if @options[:no_escaping]
        inline_tag(tag, :source, @source_string)
      else
        tag.source do |xml|
          segment(xml, @source_string)
        end
      end
    end

    def add_target_segment(tag)
      return tag.target unless @target_string

      if @options[:no_escaping]
        inline_tag(tag, :target, @target_string)
      else
        tag.target do |xml|
          segment(xml, @target_string)
        end
      end
    end

    def segment(tag, value)
      if @options[:use_cdata] && value
        tag.cdata!(value)
      else
        tag.text!(value)
      end
    end

    def inline_tag(tag, name, value)
      tag.__send__(:_indent)
      tag.__send__(:_start_tag, name, {})
      tag.__send__(:_text, value)
      tag.__send__(:_end_tag, name)
      tag.__send__(:_newline)
    end
  end
end
