class LoginController < ApplicationController

  #Login
  def create
    run User::Operation::Login do |_|
      redirect_to root_path
      return
    end
    render "new"
  end
end
