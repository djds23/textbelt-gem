module TextBelt
  extend self
  require "textbelt/version"
  require 'net/http'
  require 'json'
  require 'uri'

  # Get a list of categories from the service
  #
  # @param number [Fixnum] number to send the text to
  # @param message [String] the body of the text message
  #
  # @return [Boolean] true if TextBelt successfully passed on the message,
  #   false if not
  def text(number, message)
    res = Net::HTTP.post_form(base_url, number: number, message: message)
    body = JSON.parse(res.body)
    !!body['success'.freeze]
  end

  private

  # @private
  def base_url
    URI('http://textbelt.com/text'.freeze)
  end
end
