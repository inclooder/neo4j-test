class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users
  end
end
