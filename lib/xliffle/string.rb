module Xliffle
  class String
    attr_reader :name, :source, :target

    def initialize(id, name, source, target)
      @id = id
      @name = name
      @source = source
      @target = target
    end

    def to_xliff(xliff)
      xliff.tag!('trans-unit', { id: @id, resname: @name }) do |t|
        t.source(@source)
        t.target(@target)
      end
    end
  end
end
