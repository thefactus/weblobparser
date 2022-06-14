# frozen_string_literal: true

require_relative 'web_log_parser/version'
require_relative 'web_log_parser/line_parser'
require_relative 'web_log_parser/file_parser'
require_relative 'web_log_parser/ip_validator'

module WebLogParser
  class Error < StandardError; end
  class InvalidIpv4Error < StandardError; end
  class InvalidSimpleIpError < StandardError; end
end
