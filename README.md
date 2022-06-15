# WebLogParser

WebLogParser is a flexible solution to parse data from web log files.

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

**Note:** Sorry, this gem is not available yet on Rubygems.

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

- This gem was developed following Test Driven Development from the beginning to the end.
- The `LineParser` was the first class, followed by `FileParser`, `IpValidator`, `WebLogDecorator` and `WebLog`.
- The `WebLog` class does act as a value object, to make it easy for the developer use the parsed data. 
- Some classes have a top level documentation.
- The `.rubocop.yml` is updated.
- This project is ideally to be used as a gem, but you can use the `main.rb` file to run some tests.
- By default the gem return the values in descending order, but that can be changed by adding the order param to the WebLog instance.
- Also, by default the IP validation is simple (100.200.300.400 is valid), but by adding an ip_validation option to the LineParser instance, will allow you to validate as IPv4.

## Improvements

- Add many more tests
- Test with more different files.
- Add more class top level documentation.
- Add output options (json, csv, html and more)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/web_log_parser.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
