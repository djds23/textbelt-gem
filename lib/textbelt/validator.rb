# File to hold all the errors for TextBelt
#
# @author Dean Silfen
module TextBelt
  require 'phonelib'

  class PhoneValidator
    class << self

      # Get a list of categories from the service
      #
      # @param phone_number [String] number to send the text to
      # @param country [String] ISO 3166 Country code for destination country 
      #
      # @return [Boolean] true if TextBelt successfully passed on the message,
      #   false if not
      def validate(phone_number, country)
        unless  is_a_string?(phone_number)
          raise TextBelt::IntegerPhoneError, "Please ensure to pass phone numbers as strings."
        end

        phone = Phonelib.parse phone_number

        if phone.invalid_for_country? country
          raise TextBelt::InvalidPhoneNumberError, "#{phone_number} is not valid in destination country #{country}"
        end
      end

      private

      # @private
      def is_a_string?(phone_number)
        phone_number.is_a? String
      end
    end
  end
end
