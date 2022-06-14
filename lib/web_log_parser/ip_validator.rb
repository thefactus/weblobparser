# frozen_string_literal: true

module WebLogParser
  class IpValidator
    IPV4_VALIDATION_REGEXP = /^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/.freeze
    SIMPLE_IP_VALIDATION_REGEXP = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/.freeze

    def initialize(options)
      @options = options
    end

    def validate_ip(ip)
      case options[:ip_validation]
      when :simple then validate_simple_ip(ip)
      when :ipv4 then validate_ipv4(ip)
      else raise NotImplementedError
      end
    end

    private

    attr_reader :options

    def validate_simple_ip(ip)
      raise InvalidSimpleIpError, "#{ip} is not a valid simple ip" unless ip.match?(SIMPLE_IP_VALIDATION_REGEXP)

      true
    end

    def validate_ipv4(ip)
      raise InvalidIpv4Error, "#{ip} is not a valid IPv4" unless ip.match?(IPV4_VALIDATION_REGEXP)

      true
    end
  end
end
