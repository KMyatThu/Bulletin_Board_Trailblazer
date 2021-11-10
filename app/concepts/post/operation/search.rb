module Post::Operation
  class Search < Trailblazer::Operation
    step :search_post_list!
  
    def search_post_list!(options, params:, **)
      keyword = options[:keyword]
      options[:model] = posts = Post.where("title like ? or description like ?", "%" + keyword + "%", "%" + keyword + "%")
    end
  end
end