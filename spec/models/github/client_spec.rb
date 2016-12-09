require 'rails_helper'

describe Github::Client, type: :model do
  let(:dummy_class) do
    Class.new do
      include Github::Client

      api_domain 'https://api.github.com/'

      def client
        self.class.client
      end
    end
  end

  describe 'client' do
    context 'class method' do
      example do
        expect(dummy_class.client).to be_a Faraday::Connection
        expect(dummy_class.client.url_prefix.to_s).to eq 'https://api.github.com/'
      end
    end

    context 'instance method' do
      example do
        expect(dummy_class.new.client).to be_a Faraday::Connection
      end
    end
  end
end