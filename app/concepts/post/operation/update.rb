module Post::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(Post, :find_by)
      step self::Contract::Build(constant: Post::Contract::Create)
    end
    class Delete < Trailblazer::Operation
      step :delete!
      def delete!(options, params:, **)
        options["model"] = Post.destroy(params[:id])
      end
    end
    step Nested(Present)
    step self::Contract::Validate(key: :post)
    step self::Contract::Persist()
    step :notify!
  
    def notify!(options, model:, **)
      options["result.notify"] = Rails.logger.info("Update blog post #{model.title}.")
    end
  end
end