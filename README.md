# PIC

[Homepage](http://rubyworks.github.com/pic) /
[Report Issue](http://github.com/rubyworks/pic/issues) /
[Source Code](http://github.com/rubyworks/pic) /
[Mailing List](http://groups.google.com/rubyworks-mailinglist) /
[IRC Channel](http://chat.us.freenode.net/rubyworks)

[![Build Status](https://secure.travis-ci.org/rubyworks/pic.png)](http://travis-ci.org/rubyworks/pic)


## Description

PIC is pattern matching system roughly based on Cobol Pictures. It serves
as an alternative to Regular Expressions for common data format needs.


## Examples

    PIC['Z.99'].to_re  #=> /\d*\.\d\d/


## Status

Currently PIC is very much in a state of "design development". It will take
some time to workout the best correlations between picture and regular
expression. Suggestions and patches welcome.


## Reference Material

* [Edited Pictures](http://www.csis.ul.ie/cobol/course/EditedPics.htm)


## Copyright & License

Copyright (c) 2011 Trans, Rubyworks

