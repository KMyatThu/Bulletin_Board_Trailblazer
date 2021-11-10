class LoginController < ApplicationController

  #Login
  def create
    run User::Operation::Login do |result|
      cookies[:user_id] = { :value => result["user"].id, :expires => Time.now + 3600}
      redirect_to root_path
      return
    end
    render "new"
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to login_path
  end
end
