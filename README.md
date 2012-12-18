[Homepage](http://rubyworks.github.com/pic) /
[Report Issue](http://github.com/rubyworks/pic/issues) /
[Mailing List](http://groups.google.com/rubyworks-mailinglist) /
[IRC Channel](irc://irc.freenode.net/rubyworks) /
[Source Code](http://github.com/rubyworks/pic) /
( [![Build Status](https://secure.travis-ci.org/rubyworks/pic.png)](http://travis-ci.org/rubyworks/pic) )


# PIC

PIC is pattern matching system roughly based on Cobol Pictures. It serves
as an alternative to Regular Expressions for common data format needs.


## Usage

Here is a simply example.

~~~ruby
    PIC['Z.99'].to_re  #=> /\d*\.\d\d/
~~~


## Status

Currently PIC is very much in a state of "design development". It will take
some time to workout the best correlations between picture and regular
expression. Suggestions and patches welcome!


## Installation

Per the usual RubyGems way:

    $ gem install pic


## Reference Material

* [Edited Pictures](http://www.csis.ul.ie/cobol/course/EditedPics.htm)


## Copyright & License

PIC is copyrighted free software.

    Copyright (c) 2011 Rubyworks (BSD-2-Clause Licensed)

PIC is freely redistributable and modifiable in accordance with the
[BSD-2-Clause](http://spdx.org/licenses/bsd-2-clause) license.

See LICENSE.txt for details.
