# frozen_string_literal: true

RSpec.describe WebLogParser::IpValidator do
  describe '#validate_ip' do
    context 'when ip_validation is simple' do
      context 'when ip is simple' do
        it 'returns true' do
          ip = '387.444.653.145'
          options = {ip_validation: :simple}

          result = described_class.new(options).validate_ip(ip)

          expect(result).to eq(true)
        end
      end
    end
  end
end
