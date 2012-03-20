# Ruby Data Pictures

    require 'pic'

## Basic Regexp Conversions

    PIC['X'].to_re  #=> /./
    PIC['A'].to_re  #=> /[A-Za-z]/
    PIC['W'].to_re  #=> /\w/
    PIC['9'].to_re  #=> /\d/
    PIC['Z'].to_re  #=> /\d*/

    PIC['.'].to_re  #=> /\./
    PIC[','].to_re  #=> /\,/
    PIC['-'].to_re  #=> /\-/
    PIC['/'].to_re  #=> /\//

## General Conversions

    PIC['XX'].to_re  #=> /../
    PIC['AA'].to_re  #=> /[A-Za-z][A-Za-z]/
    PIC['WW'].to_re  #=> /\w\w/

## Advanced Conversions



