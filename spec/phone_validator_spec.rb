require 'spec_helper'

describe TextBelt::PhoneValidator do
  let(:integer_phone) { 8_765_3210 }
  let(:invalid_number) { '6666666666' }
  let(:not_valid_for_country) { '613-555-0180' }

  it 'raises an error if phone_number is not the right type' do
    expect{
      described_class.validate(integer_phone, "US")
    }.to raise_error(TextBelt::IntegerPhoneError)
  end

  it 'raises an error if phone_number is not parseable' do
    expect{
      described_class.validate(invalid_number, "US")
    }.to raise_error(TextBelt::InvalidPhoneNumberError)
  end

  it 'raises an error if country code and phone_number do not match' do
    expect{
      described_class.validate(not_valid_for_country, "US")
    }.to raise_error(TextBelt::InvalidPhoneNumberError)
  end
end

