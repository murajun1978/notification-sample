class Users::Repository < Github::ApiClient
  api_domain 'https://api.github.com'
  get :all, uri: '/users/:username/repos'

  class << self
    def find_by(params={})
      new.all(params)
    end
  end
end