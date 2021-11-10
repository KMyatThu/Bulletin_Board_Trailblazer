module User::Operation
  class Delete < Trailblazer::Operation
    step :delete_user!
  
    def delete_user!(options, params:, **)
      User.destroy(params[:id])
    end
  end
end