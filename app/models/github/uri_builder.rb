module Github
  class UriBuilder
    attr_reader :uri

    def initialize(endpoint_uri, params={})
        _params       = params.dup
        @uri          = endpoint_uri.dup
        endpoint_keys = @uri.scan(/(:[a-z_-]+)/)

        endpoint_keys.each do |key|
          endpoint_key = key.first.delete(':')
          target = _params.delete(endpoint_key.to_sym)
          @uri.gsub!(":#{endpoint_key}", target)
        end
    end
  end
end