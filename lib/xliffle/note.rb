module Xliffle
  class Note
    attr_reader :note, :priority

    def initialize(note, priority)
      @note = note
      @priority = priority
    end

    def to_xliff(xliff)
      xliff.tag!('note', { priority: @priority }, @note)
    end
  end
end
