# frozen_string_literal: true

RSpec.describe WebLogParser::WebLog do
  describe '#log_data' do
    it 'returns the parsed log data from the file' do
      file_path = 'spec/fixtures/webserver.log'
      web_log = WebLogParser.web_log_from_file(file_path)

      expect(web_log.log_data).to be_truthy
    end
  end

  describe 'paths_with_number_of_visits' do
    it 'returns an array with paths and its numbers of visits' do
      file_path = 'spec/fixtures/webserver.log'
      web_log = WebLogParser.web_log_from_file(file_path)

      expect(web_log.paths_with_number_of_visits).to eq(
        ['/about/2 90 visits', '/contact 89 visits', '/index 82 visits', '/about 81 visits',
         '/help_page/1 80 visits', '/home 78 visits']
      )
    end
  end

  describe 'paths_with_number_of_unique_visits' do
    it 'returns an array with paths and its numbers of unique visits' do
      file_path = 'spec/fixtures/webserver.log'
      web_log = WebLogParser.web_log_from_file(file_path)

      expect(web_log.paths_with_number_of_unique_visits).to eq(
        ['/index 23 unique views', '/home 23 unique views', '/contact 23 unique views',
         '/help_page/1 23 unique views', '/about/2 22 unique views', '/about 21 unique views']
      )
    end
  end
end
