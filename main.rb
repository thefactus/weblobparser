#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/web_log_parser'

if ARGV[0].nil?
  puts 'Please provide a file as an argument.'
  return
end

web_log = WebLogParser.web_log_from_file(ARGV[0])

puts '> list of webpages with most page views ordered from most pages views to less page views'
puts web_log.paths_with_number_of_visits

puts '-----------------------------'

puts '> list of webpages with most unique page views also ordered'
puts web_log.paths_with_number_of_unique_visits

puts '-----------------------------'

puts 'You can also have access to the relevant data from the logs using `web_log.log_data`'
