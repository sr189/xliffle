# frozen_string_literal: true

module Xliffle
  class Note
    attr_reader :note, :priority

    def initialize(note, options = {})
      @note = note
      @priority = options[:priority] || 2
    end

    def to_xliff(xliff)
      xliff.tag!('note', { priority: @priority }, @note)
    end
  end
end
