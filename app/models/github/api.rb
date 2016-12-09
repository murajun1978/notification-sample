module Github
  module Api
    extend ActiveSupport::Concern

    class_methods do
      def get(*args)
        _args   = args.dup
        options = _args.extract_options!
        method  = _args.first

        class_eval <<-EOF
          def #{method}(params={})
            api_builder = Github::UriBuilder.new('#{options[:uri]}', params)
            self.class.client.get(api_builder.uri, params)
          end
        EOF
      end
    end
  end
end