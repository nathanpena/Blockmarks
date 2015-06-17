class UsersController < ApplicationController
  def show
     @user = current_user
     @bookmarks = @user.bookmarks
     @likes = @user.likes
  end
end
