# frozen_string_literal: true

module WebLogParser
  class FileParser
    def initialize
      @line_parser = LineParser.new
    end

    def parse(file_path)
      log_data = {}
      file = File.open(file_path)

      file.each(chomp: true) do |line|
        path, ip = line_parser.parse(line)

        log_data[path] ||= {}
        increment_number_of_visits(path, log_data)
        add_ip(path, ip, log_data)
      end

      file.close

      log_data
    end

    private

    attr_reader :line_parser

    def increment_number_of_visits(path, log_data)
      log_data[path][:number_of_visits] ||= 0
      log_data[path][:number_of_visits] += 1
    end

    def add_ip(path, ip, log_data)
      (log_data[path][:ip_list] ||= Set.new) << ip
    end
  end
end
