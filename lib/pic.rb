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
