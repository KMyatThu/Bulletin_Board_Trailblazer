class PostsController < ApplicationController

    def index
      run Post::Operation::Index
    end

    def new
      run Post::Operation::Create::Present
    end

    def create
      run Post::Operation::Create do |result|
        return redirect_to posts_path
      end
      render :new
    end

    def edit
      run Post::Operation::Update::Present
    end

    def update
      run Post::Operation::Update do |result|
        return redirect_to posts_path
      end
      render :edit
    end

    def destroy
      run Post::Operation::Update::Delete do |result|
        return redirect_to posts_path
      end
    end
end
