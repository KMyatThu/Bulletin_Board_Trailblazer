module User::Operation
    class Login < User::Operation::Base
      step :model!
  
      def model!(options, params:, **)
        user = User.find_by(email: params[:email])
        true if user && user.authenticate(params[:password])
      end
    end
  end