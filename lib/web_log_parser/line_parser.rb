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

    DEFAULT_OPTIONS = { ip_validation: :simple }.freeze
    private_constant :DEFAULT_OPTIONS

    def initialize(options = DEFAULT_OPTIONS, ip_validator = IpValidator)
      @options = options
      @ip_validator = ip_validator.new({ip_validation: options[:ip_validation]})
    end

    def parse(line)
      path, ip = line.split
      ip_validator.validate_ip(ip)

      [path, ip]
    end

    private

    attr_reader :options, :ip_validator
  end
end
