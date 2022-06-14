# frozen_string_literal: true

module WebLogParser
  # Responsible for parsing web log files
  class FileParser
    # Parse a file and returns relevant log data
    #
    # Example:
    #   >> FileParser.new.parse('webserver.log')
    #   => {"/home"=>{:number_of_visits=>2, :ip_list=>#<Set: {"1.1.1.1", "2.2.2.2"}>}, ...
    #
    # Arguments:
    #   file_path: (String)

    def initialize
      @line_parser = LineParser.new
    end

    def parse(file_path)
      # TODO: move to a file validation class
      raise FileNotFoundError, "The file #{file_path} is missing." unless File.file?(file_path)

      unless File.extname(file_path) == '.log'
        raise InvalidFileFormatError,
              "The file #{file_path} has an invalid format"
      end

      log_data = {}
      file = File.open(file_path)

      iterate_file_lines(file, log_data)

      file.close

      log_data
    end

    private

    attr_reader :line_parser

    def iterate_file_lines(file, log_data)
      file.each(chomp: true) do |line|
        path, ip = line_parser.parse(line)

        log_data[path] ||= {}
        increment_number_of_visits(path, log_data)
        add_ip(path, ip, log_data)
      end
    end

    def increment_number_of_visits(path, log_data)
      log_data[path][:number_of_visits] ||= 0
      log_data[path][:number_of_visits] += 1
    end

    def add_ip(path, ip, log_data)
      (log_data[path][:ip_list] ||= Set.new) << ip
    end
  end
end
