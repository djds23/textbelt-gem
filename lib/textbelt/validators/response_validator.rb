module TextBelt

  # Validator for incoming http responses
  #
  # @author Dean Silfen
  class ResponseValidator
    class << self

      # Validate the response from http service
      #
      # @param phone_number [String] number to send the text to
      # @param body [Hash] The body of the server's http response
      #
      # @raise [Errors::BlackListedNumberError] http server says number is blacklisted
      # @raise [Errors::GatewayFailureError] http server had a gateway error communicating with carrier
      # @raise [Errors::PhoneCouldNotValidateError] http server cannot validate the phone\'s quota
      # @raise [Errors::IPCouldNotValidateError] http server cannot validate the ip's quota
      # @raise [Errors::PhoneQuotaExceededError] the phone's quota has been exceeded
      # @raise [Errors::IPQuotaExceededError] IP's quota has been exceeded
      #
      # @return [Boolean] true if body is valid
      #
      def validate(phone_number, body)
        return true if body['message'].nil? && body['success']
        message = body['message']
        if message == 'Sorry, texts to this number are disabled.'
          raise TextBelt::Errors::BlackListedNumberError, "#{phone_number} has been blacklisted"
        end

        if message == 'Communication with SMS gateway failed.'
          raise TextBelt::Errors::GatewayFailureError, 'A gateway failure occured between the http service and the carrier'
        end

        if message == 'Could not validate phone# quota.'
          raise TextBelt::Errors::PhoneCouldNotValidateError, "#{phone_number} could not be validated in http service"
        end

        if message == 'Could not validate IP quota.'
          raise TextBelt::Errors::IPCouldNotValidateError, message
        end

        if message.include? 'Exceeded quota for this phone number.'
          raise TextBelt::Errors::PhoneQuotaExceededError, message
        end

        if message.include? 'Exceeded quota for this IP address.'
          raise TextBelt::Errors::IPQuotaExceededError, message
        end

        true
      end
    end
  end
end

