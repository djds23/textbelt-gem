# @author Dean Silfen
module TextBelt
  class TextUtils
    class << self

      # Return the correct URL for the correct country code
      #
      # @param country [String] ISO 3166 Country code for destination country
      #
      # @return [URI] URI object holding the url to match the country code
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

      private

      # @private
      def base_url
        TextBelt.configuration.textbelt_url
      end
    end
  end
end

