module Xliffle
  class String
    attr_reader :id, :source, :target

    def initialize(id, source, target)
      @id = id
      @source = source
      @target = target
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', { id: @id }) do |t|
        t.source(@source)
        t.target(@target)
      end
    end
  end
end
