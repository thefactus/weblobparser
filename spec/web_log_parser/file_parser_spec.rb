# frozen_string_literal: true

RSpec.describe WebLogParser::FileParser do
  describe '#parse' do
    context 'when a valid log file is provided' do
      it 'returns a hash with the file data' do
        file_path = 'spec/fixtures/simple_web_log.log'
        file_parser = described_class.new

        log_data = file_parser.parse(file_path)

        expect(log_data.keys).to include('/home', '/contact')
        expect(log_data['/home'][:ip_list].to_a).to eq(['1.1.1.1', '2.2.2.2'])
        expect(log_data['/home'][:number_of_visits]).to eq(2)
        expect(log_data['/contact'][:ip_list].to_a).to eq(['2.2.2.2'])
        expect(log_data['/contact'][:number_of_visits]).to eq(1)
      end
    end

    context 'when the log file is missing' do
      it 'raises FileNotFoundError exception' do
        missing_file_path = 'spec/fixtures/missing_file.log'
        file_parser = described_class.new

        expect { file_parser.parse(missing_file_path) }.to raise_error(WebLogParser::FileNotFoundError)
      end
    end

    context 'when the log file format is wrong' do
      it 'raises InvalidFileFormatError exception' do
        file_with_wrong_format = 'spec/fixtures/file_with_wrong_format.txt'
        file_parser = described_class.new

        expect { file_parser.parse(file_with_wrong_format) }.to raise_error(WebLogParser::InvalidFileFormatError)
      end
    end
  end
end
