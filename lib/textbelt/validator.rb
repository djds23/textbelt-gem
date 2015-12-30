# File to hold all the errors for TextBelt
#
# @author Dean Silfen
module TextBelt
  class PhoneValidator
    class << self
      def validate(number)
        unless  is_a_string?(number)
          raise IntegerPhoneError, "Please ensure to pass phone numbers as strings."
        end
      end

      def is_a_string?(number)
        number.is_a? String
      end
    end
  end
end
