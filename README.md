[Website](http://rubyworks.github.com/pic) /
[Report Issue](http://github.com/rubyworks/pic/issues) /
[Source Code](http://github.com/rubyworks/pic)
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

The following links help explain concept of Edited Pictures.

* [Edited Pictures](http://www.csis.ul.ie/cobol/course/EditedPics.htm)


## Contributing

### General Discussion

If you do not have specific issue to report but would still like to discuss this library, 
you can send a message to the [Rubyworks Mailing List](http://groups.google.com/rubyworks-mailinglist),
or try to catch up with us via the [#rubyworks](irc://irc.freenode.net/rubyworks) IRC channel.

### Submitting Patches

Sending a code snippet is fine for very small changes. But beyond a few lines
of code, please use git via Github to submit pull requests. It is best to submit
a dedicated feature branch, and tests are *always* much appreciated.


## Copyright & License

PIC is copyrighted free software.

    Copyright (c) 2011 Rubyworks (BSD-2-Clause Licensed)

PIC is freely redistributable and modifiable in accordance with the
[BSD-2-Clause](http://spdx.org/licenses/bsd-2-clause) license.

See LICENSE.txt for details.
