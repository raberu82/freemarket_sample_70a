class UsersController < ApplicationController
  def index
    @nickname = current_user.nickname
  end
end
