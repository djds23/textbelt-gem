require 'spec_helper'

describe TextBelt::TextUtils do
  describe '#uri_for' do
    it 'returns the right uri for the right country code' do
      expect(described_class.uri_for 'US').to eq URI('http://textbelt.com/text')
      expect(described_class.uri_for 'CA').to eq URI('http://textbelt.com/canada')
      expect(described_class.uri_for 'GB').to eq URI('http://textbelt.com/intl')
    end
  end

  describe '#base_uri' do
    it 'has a default value' do
      expect(described_class.send(:base_uri)).to eq('http://textbelt.com/')
    end
  end
end
