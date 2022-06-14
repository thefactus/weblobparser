# frozen_string_literal: true

RSpec.describe WebLogParser::WebLogDecorator do
  describe '#paths_with_number_of_visits_descending' do
    context 'when log data is available' do
      it 'returns an array with the information for the path descending by number of visits' do
        log_data =
          {
            '/home' => { number_of_visits: 2, ip_list: ['1.1.1.1', '2.2.2.2'].to_set },
            '/contact' => { number_of_visits: 1, ip_list: ['2.2.2.2'].to_set }
          }
        web_log_decorator = described_class.new(log_data)

        result = web_log_decorator.paths_with_number_of_visits_descending

        expect(result).to eq(['/home 2 visits', '/contact 1 visit'])
      end
    end
  end
end
