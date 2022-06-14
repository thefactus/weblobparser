# frozen_string_literal: true

module WebLogParser
  class WebLogDecorator
    def initialize(log_data)
      @log_data = log_data
    end

    def paths_with_number_of_visits(order: :descending)
      collection_iterator_by(:number_of_visits, order).map do |path, data|
        visits = data[:number_of_visits]
        "#{path} #{visits} visit#{visits > 1 ? 's' : ''}"
      end
    end

    def paths_with_number_of_unique_visits(order: :descending)
      collection_iterator_by(:ip_list, order).map do |path, data|
        unique_visits = data[:ip_list].size
        "#{path} #{unique_visits} unique view#{unique_visits > 1 ? 's' : ''}"
      end
    end

    private

    attr_reader :log_data

    def collection_iterator_by(data_key, order, &block)
      ordered_log_data = log_data.sort_by { |_k, data| data[data_key] }

      return ordered_log_data.reverse.each(&block) if order == :descending

      ordered_log_data.each(&block)
    end
  end
end
