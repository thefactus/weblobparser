# frozen_string_literal: true

require_relative 'web_log_parser/version'
require_relative 'web_log_parser/line_parser'
require_relative 'web_log_parser/file_parser'
require_relative 'web_log_parser/ip_validator'
require_relative 'web_log_parser/web_log_decorator'
require_relative 'web_log_parser/web_log'

module WebLogParser
  class Error < StandardError; end
  class InvalidIpv4Error < StandardError; end
  class InvalidSimpleIpError < StandardError; end
  class FileNotFoundError < StandardError; end
  class InvalidFileFormatError < StandardError; end

  def self.web_log_from_file(file_path)
    log_data = FileParser.new.parse(file_path)
    WebLog.new(log_data)
  end
end
