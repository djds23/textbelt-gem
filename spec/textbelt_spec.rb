require 'spec_helper'

describe TextBelt do
  let(:success_phone) {  }
  let(:us_url) { described_class::TextUtils.url_for 'US' }

  describe '#text' do
    it 'returns true we receive a success response' do
      stub_request(:post, us_url).to_return(body: success_body)
      expect(described_class.text('202-555-0170', "text")).to be_truthy
    end

    it 'raises an exception if number is not passed as a string' do
       expect{
         described_class.text(666_666_6666, "text")
       }.to raise_error(described_class::Errors::IntegerPhoneError)
    end

    it 'raises an exception if number cannot be parsed by phonelib' do
      expect{
         described_class.text('this is not a phone number', "text")
       }.to raise_error(described_class::Errors::InvalidPhoneNumberError)
    end
  end
end

