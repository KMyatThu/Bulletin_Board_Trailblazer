module Post::Operation
  class Import < Trailblazer::Operation
    step :import_csv!
    
    def import_csv!(options, params:, **)
      CSV.foreach(params[:file].path, headers: true) do |row|
        post = Post.new
        post.title = row[0]
        post.description = row[1]
        post.status = row[2]
        post.create_user_id = options[:current_user]
        post.updated_user_id = options[:current_user]
        post.created_at = Time.now
        post.updated_at = Time.now
        post.save!
      end
      true
    end
  end
end