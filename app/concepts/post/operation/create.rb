class Post::Operation::Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post, :new)
      step Contract::Build( constant: Post::Contract::Create )
    end
  
    step Nested( Present )
    step :created_user_and_status!
    step Contract::Validate( key: :post )
    step Contract::Persist( )

    def created_user_and_status!(options, **)
      options[:params][:post][:status] = 1
      options[:params][:post][:create_user_id] = options[:current_user][:id]
      options[:params][:post][:updated_user_id] = options[:current_user][:id]
    end
end