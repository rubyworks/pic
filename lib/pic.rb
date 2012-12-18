# Copyright (c) 2011 Rubyworks
#
# Redistribution and use in source and binary forms, with or without modification, are
# permitted provided that the following conditions are met:
# 
#    1. Redistributions of source code must retain the above copyright notice, this list of
#       conditions and the following disclaimer.
# 
#    2. Redistributions in binary form must reproduce the above copyright notice, this list
#       of conditions and the following disclaimer in the documentation and/or other materials
#       provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING,
# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# PIC namespace.
#
module PIC

  #
  # Shortcut to `PIC::Template.new(pic)`.
  #
  # @return [PIC::Template]
  #
  def self.[](pic)
    Template.new(pic)
  end

  # Template class encapsulates a picture, handles
  # converting it to a regular expression and delagates
  # to it for matching.
  #
  class Template

    #
    # New pic template.
    #
    # @param [String] pic
    #   Picture to use for matching.
    #
    def initialize(pic)
      @pic = pic
    end

    #
    # The picture.
    #
    # @return [String] picture.
    #
    attr :pic

    #
    # Convert picture to a regular epression.
    #
    def to_re
      re = ''
      pic.scan(SCAN) do |s,c|
        re << remap(s) + recnt(c)
      end
      Regexp.new(re)
    end

    #
    # Alias for `#to_re`.
    #
    alias_method :to_regexp, :to_re

    #
    # Match picture to given string.
    #
    # @param [String] string
    #   String to match picture against.
    #
    # @return [Fixnum] index position in string of match.
    #
    def =~(string)
      to_re =~ string.to_str
    end

    alias === =~

    #
    # Checks for a non-match of the picture to a given string.
    #
    # @param [String] string
    #   String to match picture against.
    #
    # @return [Fixnum] index position in string of match.
    #
    def !~(string)
      to_re !~ string.to_str
    end

  private

    #
    def remap(s)
      REMAP[s] || raise(ArgumentError)  #('\' + s)
    end 

    #
    def recnt(c)
      return '' unless c

      case c
      when /\[(\d+)\.\.(\d+)\]/
        '{'+$1+','+$2+'}'
      when /\[(\d+)\,(\d+)\]/
        '{'+$1+','+$2+'}'
      when /\[(\d+)\]/
        '{'+$1+'}'
      end
    end

    #
    SCAN = /(\S)(\[.*?\])?/

    #
    REMAP = {
      'X' => '.',
      '9' => '\d',
      'Z' => '\d*',
      '0' => '\d',
      'A' => '[A-Za-z]',
      'W' => '\w',
      '.' => '\.',
      ',' => '\,',
      '-' => '\-',
      '/' => '\/'
    }

  end

end
