require 'builder'
require 'xliffle/file'
require 'xliffle/string'

module Xliffle
  class Creator
    attr_reader :files

    def initialize
      @files = []
    end

    def file(original, source_locale, target_locale)
      file = Xliffle::File.new(original, source_locale, target_locale)
      @files << file
      file
    end

    def to_xliff
      xliff do |x|
        @files.each do |file|
          file.to_xliff x
        end
      end
    end

    def to_file
      handle = Tempfile.new('foo.xlf')
      handle.write self.to_xliff
      handle.close
      handle
    end

    private

    def xliff(&block)
      xml = Builder::XmlMarkup.new( :indent => 2 )
      xml.instruct! :xml, :encoding => "UTF-8"
      xml.xliff({version: '1.2', xmlns: 'urn:oasis:names:tc:xliff:document:1.2'}, &block)
    end
  end
end
