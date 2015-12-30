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

end
