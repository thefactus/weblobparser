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

    IPV4_VALIDATION_REGEXP = /^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/.freeze
    SIMPLE_IP_VALIDATION_REGEXP = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/.freeze
    DEFAULT_OPTIONS = { ip_validation: :simple }.freeze
    private_constant :DEFAULT_OPTIONS

    def initialize(options = DEFAULT_OPTIONS)
      @options = options
    end

    def parse(line)
      path, ip = line.split
      validate_ip(ip)

      [path, ip]
    end

    private

    attr_reader :options

    def validate_ip(ip)
      case options[:ip_validation]
      when :simple then validate_simple_ip(ip)
      when :ipv4 then validate_ipv4(ip)
      else raise NotImplementedError
      end
    end

    def validate_simple_ip(ip)
      raise InvalidSimpleIpError, "#{ip} is not a valid simple ip" unless ip.match?(SIMPLE_IP_VALIDATION_REGEXP)
    end

    def validate_ipv4(ip)
      raise InvalidIpv4Error, "#{ip} is not a valid IPv4" unless ip.match?(IPV4_VALIDATION_REGEXP)
    end
  end
end
