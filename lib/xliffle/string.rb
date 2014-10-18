module Xliffle
  class String
    attr_reader :name, :source, :target, :notes

    def initialize(id, name, source_string, target_string)
      @id = id
      @name = name
      @source_string = source_string
      @target_string = target_string
      @notes = []
    end

    def note(note, priority=2)
      note = Xliffle::Note.new(note, priority)
      @notes << note
      note
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', { id: @id, resname: @name }) do |tag|
        tag.source(@source_string)
        tag.target(@target_string)
        @notes.each do |note|
          note.to_xliff(tag)
        end
      end
    end
  end
end
