# File to hold all the errors for TextBelt
#
# @author Dean Silfen
module TextBelt

  # Error to be raised if phone number is not passed as a string
  #
  # @author Dean Silfen
  class IntegerPhoneError < StandardError; end

  # Error to be raised if phone number is not valid in destination country
  #
  # @author Dean Silfen
  class InvalidPhoneNumberError < StandardError; end

  # Error raised if failure happens at the time of send from http service to carrier
  #
  # @author Dean Silfen
  class GatewayFailureError < StandardError; end

  # Error raised if number provided has been blacklisted
  #
  # @author Dean Silfen
  class BlackListedNumberError < StandardError; end

  # Error raised if phone number could not be validated in the http service
  #
  # @author Dean Silfen
  class PhoneCouldNotValidateError < StandardError; end

  # Error raised if phone number could not be validated in the http service
  #
  # @author Dean Silfen
  class IPCouldNotValidateError < StandardError; end

  # Error raised if service exceeded rate limit for phone number
  #
  # @author Dean Silfen
  class PhoneQuotaExceededError < StandardError; end

  # Error raised if service exceeded rate limit for IP
  #
  # @author Dean Silfen
  class IPQuotaExceededError < StandardError; end
end

