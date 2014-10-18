module Xliffle
  class File
    attr_reader :original, :strings, :source_locale, :target_locale

    def initialize(id, original, source_locale, target_locale)
      @id = id
      @strings = []
      @original = original
      @source_locale = source_locale
      @target_locale = target_locale
    end

    def string(name, source, target)
      string = Xliffle::String.new(string_id, name, source, target)
      @strings << string
      string
    end

    def to_xliff(xliff)
      xliff.file(original: @original, datatype: 'plaintext', 'source-language' => @source_locale, 'target-language' => @target_locale,) do |file|
        file.body do |body|
          self.strings.each do |string|
            string.to_xliff(body)
          end
        end
      end
    end

    private

    def string_id
      "#{ @id }_#{ @strings.length.succ }"
    end
  end
end
