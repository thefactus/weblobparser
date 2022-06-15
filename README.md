# WebLogParser

WebLogParser is a flexible solution to parse data from web log files

Rubycritic Score: 96.83 (lib folder)

Test coverage: 100%

# Check results

To quickly check the results, please use the 'main.rb' file.

```bash
$ ./main.rb webserver.log 

> list of webpages with most page views ordered from most pages views to less page views
/about/2 90 visits
...
-----------------------------
> list of webpages with most unique page views also ordered
/index 23 unique views
...
-----------------------------
You can also have access to the relevant data from the logs using `web_log.log_data`
```

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add web_log_parser

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install web_log_parser

## Usage

Usage with defautl options.

```ruby
file_path = 'some_file_path.log'

# creates a WebLog object in which you access the relevant log data
web_log = WebLogParser.web_log_from_file(file_path)

web_log.log_data
# {"/home"=>{:number_of_visits=>2, :ip_list=>#<Set: {"1.1.1.1", "2.2.2.2"}>}, ...

# by default returns an array with paths and its numbers of visits ordered from most pages visits to less page visits
web_log.paths_with_number_of_visits
# ['/home 2 visits', ...

# by default returns an array with paths and its numbers of unique visits ordered the same way
web_log.paths_with_number_of_unique_visits
# ['/home 2 unique views', ...

# you can change the order by providing a order param, in which is :descending by default
web_log.paths_with_number_of_visits(order: :ascending)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/web_log_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
