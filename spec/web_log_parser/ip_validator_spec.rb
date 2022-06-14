# frozen_string_literal: true

RSpec.describe WebLogParser::IpValidator do
  describe '#validate_ip' do
    context 'when ip_validation is simple' do
      let(:options) { { ip_validation: :simple } }

      context 'when ip is simple' do
        it 'returns true' do
          ip = '387.444.653.145'

          result = described_class.new(options).validate_ip(ip)

          expect(result).to be(true)
        end
      end

      context 'when ip is not valid' do
        it 'raises a InvalidSimpleIpError exception' do
          invalid_ip = '1.2.3.4.5'

          expect do
            described_class.new(options).validate_ip(invalid_ip)
          end.to raise_error(WebLogParser::InvalidSimpleIpError)
        end
      end
    end

    context 'when ip_validation is ipv4' do
      let(:options) { { ip_validation: :ipv4 } }

      context 'when ip is a valid ipv4' do
        it 'returns true' do
          valid_ipv4 = '192.168.0.1'

          result = described_class.new(options).validate_ip(valid_ipv4)

          expect(result).to be(true)
        end
      end

      context 'when ip is not a valid ipv4' do
        it 'raises a InvalidIpv4Error exception' do
          invalid_ipv4 = '300.400.500.600'

          expect do
            described_class.new(options).validate_ip(invalid_ipv4)
          end.to raise_error(WebLogParser::InvalidIpv4Error)
        end
      end
    end

    context 'when the ip validation options is unknown' do
      it 'raises a NotImplementedError exception' do
        ip = '387.444.653.145'
        options = { ip_validation: :unknown }

        expect { described_class.new(options).validate_ip(ip) }.to raise_error(NotImplementedError)
      end
    end
  end
end
