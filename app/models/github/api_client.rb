module Github
  class ApiClient
    include Github::Client
    include Github::Api
  end
end