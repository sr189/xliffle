# frozen_string_literal: true

require 'xliffle/creator'
require 'xliffle/file'
require 'xliffle/string'
require 'xliffle/note'

module Xliffle
  def self.new
    Xliffle::Creator.new
  end
end
