require 'spec_helper'

describe TextBelt::ResponseValidator do
  let(:valid_phone) { '202-555-0198' }

  describe '#validate' do
    it 'raises no error if the phone number and country are valid' do
      expect(described_class.validate(valid_phone, JSON.parse(success_body))).to be_truthy
    end

    it 'raises an error if server says number is blacklisted' do
      expect{
        described_class.validate(valid_phone, blacklist_hash)
      }.to raise_error(TextBelt::BlackListedNumberError)
    end

    it 'raises an error if http server has a gateway error' do
      expect{
        described_class.validate(valid_phone, gateway_hash)
      }.to raise_error(TextBelt::GatewayFailureError)
    end

    it "raises an error if http server cannot validate the phone's quota" do
      expect{
        described_class.validate(valid_phone, invalid_phone_quota_hash)
      }.to raise_error(TextBelt::PhoneCouldNotValidateError)
    end

    it "raises an error if http server cannot validate the ip's quota" do
      expect{
        described_class.validate(valid_phone, invalid_ip_quota_hash)
      }.to raise_error(TextBelt::IPCouldNotValidateError)
    end

    it "raises an error if the phone's quota has been exceeded" do
      expect{
        described_class.validate(valid_phone, phone_quota_exceeded_hash)
      }.to raise_error(TextBelt::PhoneQuotaExceededError)
    end

    it "raises an error if the IP's quota has been exceeded" do
      expect{
        described_class.validate(valid_phone, ip_quota_exceeded_hash)
      }.to raise_error(TextBelt::IPQuotaExceededError)
    end
  end
end

