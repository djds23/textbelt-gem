# @author Dean Silfen
module TextBelt
  extend self
  require 'textbelt/validator'
  require 'textbelt/version'
  require 'textbelt/errors'
  require 'net/http'
  require 'json'
  require 'uri'


  # Get a list of categories from the service
  #
  # @param number [String] number to send the text to
  # @param message [String] the body of the text message
  # @param country [String] ISO 3166 Country code for destination country
  #
  # @return [Boolean] true if TextBelt successfully passed on the message,
  #   false if not
  def text(number, message, country = 'US')
    PhoneValidator.validate(number, country)
    url = url_for(country)
    res = Net::HTTP.post_form(url, number: number, message: message)
    body = JSON.parse(res.body)
    !!body['success'.freeze]
  end

  private

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
end
