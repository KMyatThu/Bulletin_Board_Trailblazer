module User::Operation
  class Update < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step :model!
      step self::Contract::Build(constant: User::Contract::Base)
      def model!(options, params:, **)
        options["model"] = User.find_by(id: params[:id])
      end
    end
    step Nested(Present)
    step self::Contract::Validate(key: :user)
    step :notify!
    step Contract::Persist( )
  
    def notify!(options, params:, **)
      options["result.notify"] = Rails.logger.info("New blog post #{model.name}.")
    end
  end
end