require 'spec_helper'

describe TextBelt::PhoneValidator do
  let(:valid_phone) { '202-555-0198' }
  let(:integer_phone) { 8_765_3210 }
  let(:invalid_number) { '666666666666666' }

  describe '#validate' do
    it 'raises no error if the phone number and country are valid' do
      expect(described_class.validate(valid_phone, 'US')).to be_nil
    end

    it 'raises an error if phone_number is not the right type' do
      expect{
        described_class.validate(integer_phone, "US")
      }.to raise_error(TextBelt::Errors::IntegerPhoneError)
    end

    it 'raises an error if phone_number is not parseable' do
      expect{
        described_class.validate(invalid_number, "US")
      }.to raise_error(TextBelt::Errors::InvalidPhoneNumberError)
    end
  end
end

