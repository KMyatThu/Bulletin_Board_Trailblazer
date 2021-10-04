module User::Operation
  class Create < Trailblazer::Operation
    class Present < Trailblazer::Operation
      step Model(::User, :new)
      step self::Contract::Build(constant: User::Contract::Base)
    end
  end
end