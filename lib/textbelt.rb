# @author Dean Silfen
module TextBelt
  require 'textbelt/validators/response_validator'
  require 'textbelt/validators/phone_validator'
  require 'textbelt/textutils'
  require 'textbelt/version'
  require 'textbelt/errors'
  require 'configurations'
  require 'net/http'
  require 'json'
  require 'uri'

  include Configurations
  configurable String, :textbelt_uri do |value|
    unless value =~ /\A#{URI::regexp(['http', 'https'])}\z/
      raise InvalidURIError, "textbelt_uri must be a valid URI, #{value} does not appear valid to URI::regexp"
    end
  end

  configuration_defaults do |config|
    config.textbelt_uri = "http://textbelt.com/"
  end

  # Get a list of categories from the service
  #
  # @param phone_number [String] number to send the text to
  # @param message [String] the body of the text message
  # @param country [String] ISO 3166 Country code for destination country
  #
  # @raise [Errors::IntegerPhoneError] phone number passed as an integer
  # @raise [Errors::InvalidPhoneNumberError] phone number is not valid
  # @raise [Errors::BlackListedNumberError] http server says number is blacklisted
  # @raise [Errors::GatewayFailureError] http server had a gateway error communicating with carrier
  # @raise [Errors::PhoneCouldNotValidateError] http server cannot validate the phone\'s quota
  # @raise [Errors::IPCouldNotValidateError] http server cannot validate the ip's quota
  # @raise [Errors::PhoneQuotaExceededError] the phone's quota has been exceeded
  # @raise [Errors::IPQuotaExceededError] IP's quota has been exceeded
  #
  # @return [Boolean] true if TextBelt successfully passed on the message
  #
  def text(phone_number, message, country = 'US')
    PhoneValidator.validate(phone_number, country)
    uri = TextUtils.uri_for(country)
    res = Net::HTTP.post_form(uri, number: phone_number, message: message)
    body = JSON.parse(res.body)
    ResponseValidator.validate(phone_number, body)
    body['success'.freeze]
  end

  module_function :text
end

