module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(User, :new)
      step self::Contract::Build(constant: User::Contract::Base)
    end
    step Nested( Present )
    step Contract::Validate( key: :user )
    step Contract::Persist( )
  end
end