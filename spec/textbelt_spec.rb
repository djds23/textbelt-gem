require 'spec_helper'

describe TextBelt do
  let(:base_url) { described_class.send(:base_url) }
  let(:fail_phone) { '1-234-5678' }
  let(:success_phone) { '8-765-3210' }

  describe '#text' do
    it 'returns true we receive a success response' do
      stub_request(:post, base_url).to_return(body: success_body)
      expect(described_class.text(success_phone, "text")).to be_truthy
    end

    it 'returns false we receive a failure response' do
      stub_request(:post, base_url).to_return(body: failure_body)
      expect(described_class.text(fail_phone, "text")).to be_falsey
    end
  end

  describe '#base_url' do
    it 'has a default value' do
      expect(described_class.send(:base_url)).to eq(URI('http://textbelt.com/text'))
    end
  end

  describe '::VERSION' do
    it 'has a version' do
      expect(described_class::VERSION).to be_a(String)
    end
  end
end
