# @author Dean Silfen
module TextBelt
  class TextUtils
    class << self

      # Return the correct URI for the correct country code
      #
      # @param country [String] ISO 3166 Country code for destination country
      #
      # @return [URI] URI object holding the uri to match the country code
      def uri_for(country)
        uri_string =
          case country
          when 'US'
            base_uri + 'text'
          when 'CA'
            base_uri + 'canada'
          else
            base_uri + 'intl'
          end

        URI(uri_string)
      end

      private

      # @private
      def base_uri
        TextBelt.configuration.textbelt_uri
      end
    end
  end
end

