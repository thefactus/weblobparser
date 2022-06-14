# frozen_string_literal: true

module WebLogParser
  class WebLog
    attr_reader :log_data

    def initialize(log_data)
      @log_data = log_data
    end

    def paths_with_number_of_visits(order: :descending)
      WebLogDecorator.new(log_data).paths_with_number_of_visits(order: order)
    end

    def paths_with_number_of_unique_visits(order: :descending)
      WebLogDecorator.new(log_data).paths_with_number_of_unique_visits(order: order)
    end
  end
end
