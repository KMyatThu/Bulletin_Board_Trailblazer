class UsersController < ApplicationController
  # User List
  def index
    run User::Operation::List do |op|
      @users = op["model"]
    end
  end

  def new
    run User::Operation::Create::Present
  end
  #User Create
  def create
    run User::Operation::Create, current_user: current_user do |_|
      return redirect_to users_path
    end
    render "new"
  end

  def edit
    run User::Operation::Update::Present
  end

  def update
    run User::Operation::Update do |result|
        return redirect_to users_path
    end
    render :edit
  end

  def show
    run User::Operation::Update::Present
  end

  def destroy
    run User::Operation::Delete
    return redirect_to users_path
  end

  def profile
    run User::Operation::Update::Present
  end
end
