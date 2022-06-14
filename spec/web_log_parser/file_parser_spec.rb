# frozen_string_literal: true

RSpec.describe WebLogParser::FileParser do
  describe '#parse' do
    context 'when a valid log file is provided' do
      it 'returns a hash with the file data' do
        file_path = 'spec/fixtures/simple_web_log.log'
        file_parser = described_class.new

        log_data = file_parser.parse(file_path)

        expect(log_data.keys).to include('/home', '/contact')
      end
    end
  end
end
