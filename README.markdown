# AudioGlue sox based adapter

[![Build Status](https://travis-ci.org/TMXCredit/audio_glue-sox_adapter.png?branch=master)](https://travis-ci.org/TMXCredit/audio_glue-sox_adapter)

An [AudioGlue](https://github.com/TMXCredit/audio_glue/) adapter based on the
[sox](http://sox.sourceforge.net) command line tool.


## Dependencies

* SoX (for sox adapter)

### Debian / Ubuntu

```bash
  apt-get install sox
```

### Mac

```bash
  # Note: flac must be installed before sox so it will link during compilation.
  # One of the following:
  sudo port install flac sox
  brew install flac sox
```

## Usage

For now the adapter supports only `:file` snippet types.

Usage example:

```ruby
  adapter = AudioGlue::SoxAdapter.new
  builder = AudioGlue::Builder.new(adapter)

  # Build binary audio using an instance of AudioGlue::Template:
  builder.build(template)
```


## Credits

* [Sergey Potapov](https://github.com/greyblake)

## Copyright

Copyright (c) 2013 TMX Credit. See LICENSE.txt for further details.
