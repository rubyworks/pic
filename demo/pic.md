# Ruby Data Pictures

## Overview

PIC is pattern matching system roughly based on Cobol Pictures. It serves
as an alternative to Regular Expressions for common data format needs.

## Requiring the Library

To use the library, first require "pic".

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

## General Regexp Conversions

    PIC['XX'].to_re  #=> /../
    PIC['AA'].to_re  #=> /[A-Za-z][A-Za-z]/
    PIC['WW'].to_re  #=> /\w\w/

## Advanced Regexp Conversions

    PIC['99.99'].to_re  #=> /\d\d\.\d\d/

