module User::Operation
  class List < User::Operation::Base
    step :model!

    def model!(options, params:, **)
      options["model"] = User.all
    end
  end
end