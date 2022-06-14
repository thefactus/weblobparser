# frozen_string_literal: true

RSpec.describe WebLogParser::LineParser do
  describe '#parse' do
    context 'when a valid log line is provided' do
      it 'returns an array with the path and the ip address' do
        valid_line = '/home 87.74.253.145'
        line_parser = described_class.new

        result = line_parser.parse(valid_line)

        expect(result).to eq(['/home', '87.74.253.145'])
      end
    end
  end
end
