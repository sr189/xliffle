module Xliffle
  class File
    attr_reader :original, :strings, :source_locale, :target_locale

    def initialize(original, source_locale, target_locale)
      @strings = []
      @original = original
      @source_locale = source_locale
      @target_locale = target_locale
    end

    def string(id, source, target, options={})
      string = Xliffle::String.new(id, source, target, options)
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
  end
end
