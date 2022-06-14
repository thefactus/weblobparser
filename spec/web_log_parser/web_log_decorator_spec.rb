# frozen_string_literal: true

RSpec.describe WebLogParser::WebLogDecorator do
  describe '#paths_with_number_of_visits' do
    context 'when log data is available and order is descending' do
      it 'returns an array with number of visits for the path' do
        log_data =
          {
            '/home' => { number_of_visits: 2, ip_list: ['1.1.1.1', '2.2.2.2'].to_set },
            '/contact' => { number_of_visits: 1, ip_list: ['2.2.2.2'].to_set }
          }
        web_log_decorator = described_class.new(log_data)

        result = web_log_decorator.paths_with_number_of_visits(order: :descending)

        expect(result).to eq(['/home 2 visits', '/contact 1 visit'])
      end
    end

    context 'when log data is available and order is ascending' do
      it 'returns an array with number of visits for the path' do
        log_data =
          {
            '/home' => { number_of_visits: 2, ip_list: ['1.1.1.1', '2.2.2.2'].to_set },
            '/contact' => { number_of_visits: 1, ip_list: ['2.2.2.2'].to_set }
          }
        web_log_decorator = described_class.new(log_data)

        result = web_log_decorator.paths_with_number_of_visits(order: :ascending)

        expect(result).to eq(['/contact 1 visit', '/home 2 visits'])
      end
    end
  end

  describe '#paths_with_number_of_unique_visits' do
    context 'when log data is available and order is descending' do
      it 'returns an array with number of unique visits for the path' do
        log_data =
          {
            '/home' => { number_of_visits: 2, ip_list: ['1.1.1.1', '2.2.2.2'].to_set },
            '/contact' => { number_of_visits: 1, ip_list: ['2.2.2.2'].to_set }
          }
        web_log_decorator = described_class.new(log_data)

        result = web_log_decorator.paths_with_number_of_unique_visits(order: :descending)

        expect(result).to eq(['/home 2 unique views', '/contact 1 unique view'])
      end
    end

    context 'when log data is available and order is ascending' do
      it 'returns an array with number of unique visits for the path' do
        log_data =
          {
            '/home' => { number_of_visits: 2, ip_list: ['1.1.1.1', '2.2.2.2'].to_set },
            '/contact' => { number_of_visits: 1, ip_list: ['2.2.2.2'].to_set }
          }
        web_log_decorator = described_class.new(log_data)

        result = web_log_decorator.paths_with_number_of_unique_visits(order: :ascending)

        expect(result).to eq(['/contact 1 unique view', '/home 2 unique views'])
      end
    end
  end
end
