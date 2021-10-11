class UsersController < ApplicationController
  # User List
  def index
    run User::Operation::List do |op|
      @users = op["model"]
    end
  end

  #User Create
  def create
    dd
    run User::Operation::Create.process()
  end
end
