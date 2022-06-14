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
        log_data[path][:number_of_visits] ||= 0
        log_data[path][:number_of_visits] += 1
        (log_data[path][:ip_list] ||= Set.new) << ip
      end

      file.close

      log_data
    end

    private

    attr_reader :line_parser
  end
end
