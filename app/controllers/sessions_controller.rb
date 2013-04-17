class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def index
    # oauth_access_token = current_user["oauth_token"]
    @graph = Koala::Facebook::API.new(current_user["oauth_token"])
    @profile = @graph.get_object("me")
    @friends = @graph.get_connections("me", "friends")

  end

end

