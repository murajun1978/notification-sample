Rails.application.routes.draw do
  get 'users/:username/repositories', to: 'users/repositories#index'
end
