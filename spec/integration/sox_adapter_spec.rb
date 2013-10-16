require 'spec_helper'

describe 'Integration: AudioGlue::SoxAdapter' do
  let(:output_file) { gen_tmp_filename('wav') }

  after do
    FileUtils.rm output_file if File.exists?(output_file)
  end


  let(:packet) { AudioGlue::SnippetPacket.new(:wav, 96000, 1) }

  def add_file_snippet(file_name)
    file_path = fixture("input/#{file_name}")
    snippet = AudioGlue::Snippet.new(:file, file_path, packet)
    packet.snippets << snippet
  end

  it 'should build audio' do
    add_file_snippet 'hi.wav'
    add_file_snippet 'how_are_you_doing.wav'
    add_file_snippet 'fine_thanks.wav'
    add_file_snippet 'bye_bye.wav'

    adapter = AudioGlue::SoxAdapter.new

    output_data = adapter.build(packet)
    File.binwrite(output_file, output_data)

    output_file.should have_channels(1)
    output_file.should have_rate(96000)
    output_file.should sound_like fixture('output/hi_how_are_you_fine_bye.wav')
  end
end
