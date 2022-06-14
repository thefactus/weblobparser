# frozen_string_literal: true

RSpec.describe WebLogParser do
  it 'has a version number' do
    expect(WebLogParser::VERSION).not_to be_nil
  end

  describe '#web_log_from_file' do
    context 'when using default options' do
      it 'returns a WebLog object' do
        file_path = 'spec/fixtures/webserver.log'
        web_log = described_class.web_log_from_file(file_path)
        expect(web_log).to be_truthy
      end
    end
  end
end
