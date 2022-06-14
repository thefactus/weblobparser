# frozen_string_literal: true

module WebLogParser
  class WebLogDecorator
    def initialize(log_data)
      @log_data = log_data
    end

    def paths_with_number_of_visits_descending
      ordered_log_data_by(:number_of_visits, :descending).map do |path, data|
        visits = data[:number_of_visits]
        "#{path} #{visits} visit#{visits > 1 ? 's' : ''}"
      end
    end

    private

    attr_reader :log_data

    def ordered_log_data_by(data_key, order)
      ordered_log_data = log_data.sort_by { |_k, data| data[data_key] }

      return ordered_log_data.reverse if order == :descending

      ordered_log_data
    end
  end
end
