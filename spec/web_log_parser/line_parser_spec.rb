# frozen_string_literal: true

RSpec.describe WebLogParser::LineParser do
  describe '#parse' do
    context 'when log line string is provided' do
      context 'when path and ip address are valid' do
        it 'returns an array with the path and the ip address' do
          valid_line = '/home 87.74.253.145'
          line_parser = described_class.new

          result = line_parser.parse(valid_line)

          expect(result).to eq(['/home', '87.74.253.145'])
        end
      end

      context 'when ip validation option is ipv4' do
        context 'when the ip address is an invalid ipv4' do
          it 'raises a InvalidIpv4Error exception' do
            invalid_ipv4_line = '/home 184.123.665.067'
            line_parser = described_class.new({ ip_validation: :ipv4 })

            expect { line_parser.parse(invalid_ipv4_line) }.to raise_error(WebLogParser::InvalidIpv4Error)
          end
        end
      end

      context 'when ip validation options is simple' do
        context 'when ip address is an invalid ipv4 but a valid simple ip' do
          it 'does not raise an error' do
            invalid_ipv4_line = '/home 184.123.665.067'
            line_parser = described_class.new({ ip_validation: :simple })

            expect { line_parser.parse(invalid_ipv4_line) }.not_to raise_error
          end
        end
      end
    end
  end
end
