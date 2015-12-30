# @author Dean Silfen
module TextBelt
  require 'textbelt/validators/response_validator'
  require 'textbelt/validators/phone_validator'
  require 'textbelt/version'
  require 'textbelt/errors'
  require 'net/http'
  require 'json'
  require 'uri'


  # Get a list of categories from the service
  #
  # @param phone_number [String] number to send the text to
  # @param message [String] the body of the text message
  # @param country [String] ISO 3166 Country code for destination country
  #
  # @raise [BlackListedNumberError] http server says number is blacklisted
  # @raise [GatewayFailureError] http server had a gateway error communicating with carrier
  # @raise [PhoneCouldNotValidateError] http server cannot validate the phone\'s quota
  # @raise [IPCouldNotValidateError] http server cannot validate the ip's quota
  # @raise [PhoneQuotaExceededError] the phone's quota has been exceeded
  # @raise [IPQuotaExceededError] IP's quota has been exceeded
  #
  # @return [Boolean] true if TextBelt successfully passed on the message,
  #   false if not
  def text(phone_number, message, country = 'US')
    PhoneValidator.validate(phone_number, country)
    url = url_for(country)
    res = Net::HTTP.post_form(url, number: phone_number, message: message)
    body = JSON.parse(res.body)
    ResponseValidator.validate(phone_number, body)
    body['success'.freeze]
  end

  # @private
  def url_for(country)
    url_string =
      case country
      when 'US'
        base_url + 'text'
      when 'CA'
        base_url + 'canada'
      else
        base_url + 'intl'
      end

    URI(url_string)
  end

  # @private
  def base_url
    'http://textbelt.com/'
  end

  module_function :text
  module_function :base_url
  module_function :url_for
end
