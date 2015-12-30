module TextBelt
  class ResponseValidator
    class << self
      def validate(phone_number, body)
        return true if body['message'].nil? && body['success']
        message = body['message']
        if message == 'Sorry, texts to this number are disabled.'
          raise TextBelt::BlackListedNumberError, "#{phone_number} has been blacklisted"
        end

        if message == 'Communication with SMS gateway failed.'
          raise TextBelt::GatewayFailureError, 'A gateway failure occured between the http service and the carrier'
        end

        if message == 'Could not validate phone# quota.'
          raise TextBelt::PhoneCouldNotValidateError, "#{phone_number} could not be validated in http service"
        end

        if message == 'Could not validate IP quota.'
          raise TextBelt::IPCouldNotValidateError, message
        end

        if message.include? 'Exceeded quota for this phone number.'
          raise TextBelt::PhoneQuotaExceededError, message
        end

        if message.include? 'Exceeded quota for this IP address.'
          raise TextBelt::IPQuotaExceededError, message
        end
      end
    end
  end
end
