require 'spec_helper'

describe AudioGlue::SoxAdapter do
  let(:adapter)        { described_class.new }
  let(:snippet_packet) { AudioGlue::SnippetPacket.new(:mp3, 22050, 1) }

  describe '#build' do
    it 'should catch Sox::Error and raise AudioGlue::BuildError' do
      adapter.should_receive(:write).and_raise(::Sox::Error)

      expect { adapter.build(snippet_packet) }.
        to raise_error(::AudioGlue::BuildError)
    end

    it 'should raise AudioGlue::BuildError if snippet is not supported' do
      snippet_packet.snippets <<
        AudioGlue::Snippet.new(:yo, 'Source', snippet_packet)

      expect { adapter.build(snippet_packet) }.
        to raise_error( ::AudioGlue::BuildError,
                        "SoxAdapter doesn't support snippet type :yo" )
    end
  end
end

