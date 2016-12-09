module Github
  module Client
    extend ActiveSupport::Concern

    class_methods do
      attr_reader :client

      def api_domain(url)
        @api_domain = url
      end

      def client
        @client ||= Faraday.new(url: @api_domain) do |faraday|
                      faraday.request  :json
                      faraday.response :json
                      faraday.use      :instrumentation
                      faraday.adapter  Faraday.default_adapter
                    end
      end
    end
  end
end