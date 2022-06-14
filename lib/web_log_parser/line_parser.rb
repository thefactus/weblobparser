# frozen_string_literal: true

module WebLogParser
  # Responsible for parsing a line from the logs
  class LineParser
    # Parse a web log line and return an array with the data
    #
    # Example:
    #   >> LineParser.new.parse('/home 87.74.253.145')
    #   => ['/home', '87.74.253.145']
    #
    # Arguments:
    #   line: (String)

    def parse(line)
      path, ip = line.split

      [path, ip]
    end
  end
end
