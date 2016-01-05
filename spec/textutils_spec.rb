require 'spec_helper'

describe TextBelt::TextUtils do
  describe '#url_for' do
    it 'returns the right url for the right country code' do
      expect(described_class.url_for 'US').to eq URI('http://textbelt.com/text')
      expect(described_class.url_for 'CA').to eq URI('http://textbelt.com/canada')
      expect(described_class.url_for 'GB').to eq URI('http://textbelt.com/intl')
    end
  end

  describe '#base_url' do
    it 'has a default value' do
      expect(described_class.send(:base_url)).to eq('http://textbelt.com/')
    end
  end
end
