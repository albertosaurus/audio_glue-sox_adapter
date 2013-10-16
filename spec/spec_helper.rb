$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'chromaprint'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'audio_glue/sox_adapter'


# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

FIXTURES_PATH = File.expand_path('../fixtures', __FILE__)

RSpec.configure do |config|
  # Get the absolute path to a fixture file by its filename.
  #
  # @param filename [String]
  #
  # @return [String] path
  def fixture(file)
    File.join(FIXTURES_PATH, file)
  end

  # Generate the filename for a temporary file.
  #
  # @param ext [String] file extension
  #
  # @return [String] filename
  def gen_tmp_filename(ext = 'mp3')
    Dir::Tmpname.make_tmpname ['/tmp/audio-glue-test-', ".#{ext}"], nil
  end
end
