class PostsController < ApplicationController
  before_action :authorized
    def index
      run Post::Operation::Index do |result|
        respond_to do |format|
          format.html
          format.csv { send_data result[:model].to_csv }
        end
      end
    end

    def new
      run Post::Operation::Create::Present
    end

    def create
      run Post::Operation::Create, current_user: current_user do |result|
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

    def search
      run Post::Operation::Search, keyword: params[:keyword] do |result|
        return render :index
      end
    end

    def import
      if (params[:file].nil?)
        redirect_to upload_posts_path, notice: Messages::POST_UPLOAD_FILE_VALIDATION
      elsif !File.extname(params[:file]).eql?(".csv")
        redirect_to upload_posts_path, notice: Messages::POST_UPLOAD_CSV_FORMAT_ERROR
      else
        error_messages = PostsHelper.check_header(Constants::POST_CSV_HEADER,params[:file])
          if error_messages.present?
            redirect_to upload_posts_path, notice: error_messages
          else
            # Post.import(params[:file],current_user.id)
            run Post::Operation::Import, current_user: current_user.id do |result|
              redirect_to root_path, notice: Messages::POST_UPLOAD_SUCCESS
            end
          end
      end
    end
end
