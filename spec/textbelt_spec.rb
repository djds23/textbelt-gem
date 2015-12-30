require 'spec_helper'

describe TextBelt do
  let(:base_url) { described_class.send(:base_url) }
  let(:fail_phone) { '1-202-555-0180' }
  let(:success_phone) { '1-202-555-0170' }
  let(:us_url) { described_class.send(:url_for, 'US') }

  describe '#text' do
    it 'returns true we receive a success response' do
      stub_request(:post, us_url).to_return(body: success_body)
      expect(described_class.text(success_phone, "text")).to be_truthy
    end

    it 'returns false we receive a failure response' do
      stub_request(:post, us_url).to_return(body: failure_body)
      expect(described_class.text(fail_phone, "text")).to be_falsey
    end
  end

  describe '#url_for' do
    it 'returns the right url for the right country code' do
      expect(described_class.send(:url_for, 'US')).to eq URI('http://textbelt.com/text')
      expect(described_class.send(:url_for, 'CA')).to eq URI('http://textbelt.com/canada')
      expect(described_class.send(:url_for, 'GB')).to eq URI('http://textbelt.com/intl')
    end
  end

  describe '#base_url' do
    it 'has a default value' do
      expect(described_class.send(:base_url)).to eq('http://textbelt.com/')
    end
  end

  describe '::VERSION' do
    it 'has a version' do
      expect(described_class::VERSION).to be_a(String)
    end
  end
end
