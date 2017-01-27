module Xliffle
  class String
    attr_reader :id, :source, :target, :notes, :resource_name

    def initialize(id, source_string, target_string, options={})
      @id = id
      @source_string = source_string
      @target_string = target_string
      @resource_name = options[:resource_name]
      @notes = []
    end

    def note(note, priority=2)
      note = Xliffle::Note.new(note, priority: priority)
      @notes << note
      note
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', attributes) do |tag|
        tag.source(@source_string)
        tag.target(@target_string)
        @notes.each do |note|
          note.to_xliff(tag)
        end
      end
    end

    private

    def attributes
      attributes = { id: @id }
      attributes[:resname] = @resource_name if @resource_name

      attributes
    end
  end
end
