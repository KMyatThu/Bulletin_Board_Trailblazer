module User::Operation
    class Login < User::Operation::Base
      step :model!
  
      def model!(options, params:, **)
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          return options["user"] = user
        end
      end
    end
  end