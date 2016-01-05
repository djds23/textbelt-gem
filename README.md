# Textbelt

[![Build Status](https://travis-ci.org/djds23/textbelt-gem.svg?branch=master)](https://travis-ci.org/djds23/textbelt-gem)
[![Gem Version](https://badge.fury.io/rb/textbelt.svg)](https://rubygems.org/gems/textbelt)

A ruby interface for sending texts free of charge through [TextBelt](http://textbelt.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'textbelt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install textbelt

## Usage

The main API is [`TextBelt.text`](http://www.rubydoc.info/github/djds23/textbelt-gem/master/TextBelt.text). Sending messages should be as simple as passing a number & message, then watching it go!

```ruby
TextBelt.text('01234567', 'Hello, World!') #=> Your favorite cell phone number gets a text message
```

If there are any errors that happen server side, we raise then as exceptions locally, see the documentation for `text` for a look at the different errors that might be raised.

```ruby
require 'textbelt'

def send_cats(number)
  TextBelt.text(number, 'https://www.youtube.com/watch?v=tntOCGkgt98')
rescue TextBelt::Errors::PhoneQuotaExceededError => e
  puts 'too many cats!!!!'
rescue TextBelt::Errors::BlackListedNumberError => e
  puts 'can not send any more cats to that number :('
end
```

[See the full documentation here.](http://www.rubydoc.info/github/djds23/textbelt-gem/master)
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/djds23/textbelt-gem.

## License

The MIT License (MIT)

Copyright (c) 2015 Dean Silfen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
