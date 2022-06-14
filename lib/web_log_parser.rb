# frozen_string_literal: true

require_relative 'web_log_parser/version'
require_relative 'web_log_parser/line_parser'

module WebLogParser
  class Error < StandardError; end
  class InvalidIpv4Error < StandardError; end
  class InvalidSimpleIpError < StandardError; end
end
