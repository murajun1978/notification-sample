require 'rails_helper'

describe Github::UriBuilder, type: :model do
  let(:uri) { '/users/:username/repos' }
  let(:params) do
    { username: 'murajun1978' }
  end

  example do
    uri_builder = Github::UriBuilder.new(uri, params)
    expect(uri_builder.uri).to eq "/users/#{params[:username]}/repos"
  end
end