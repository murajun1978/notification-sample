class Users::RepositoriesController < ApplicationController
  def index
    repositories = Users::Repository.new
    res = repositories.all(repository_params)

    render json: res.body
  end

  private

    def repository_params
      params.permit(:username)
    end
end
