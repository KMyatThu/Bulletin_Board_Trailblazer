module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step Contract::Build(constant: User::Contract::Base)
    end
    step Nested( Present )
    step :current_user!
    step Contract::Validate( key: :user )
    step Contract::Persist( )
    step :notify!
  
    def current_user!(options, params:, **)
      options[:params][:user][:role] = params[:user][:role]
      options[:params][:user][:create_user_id] = options[:current_user][:id]
      options[:params][:user][:updated_user_id] = options[:current_user][:id]
    end

    def notify!(options, model:, **)
      options["result.notify"] = Rails.logger.info("New blog post #{model.name}.")
    end
  end
end