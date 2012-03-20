module PIC

  #
  def self.[](pic)
    Template.new(pic)
  end

  #
  class Template

    #
    def initialize(pic)
      @pic = pic
    end

    #
    attr :pic

    #
    def to_re
      re = ''
      pic.scan(SCAN) do |s,c|
        re << remap(s) + recnt(c)
      end
      Regexp.new(re)
    end

    #
    alias_method :to_regexp, :to_re

    #
    def =~(string)
      to_re =~ string
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
