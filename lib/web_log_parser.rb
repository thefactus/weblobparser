# frozen_string_literal: true

require_relative 'web_log_parser/version'
require_relative 'web_log_parser/line_parser'

module WebLogParser
  IPV4_VALIDATION_REGEXP = /^((?:(?:^|\.)(?:\d|[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/.freeze

  class Error < StandardError; end
  class InvalidIpv4Error < StandardError; end
end
