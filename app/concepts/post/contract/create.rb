require "reform/form/validation/unique_validator"
module Post::Contract
    class Create < Reform::Form

      property :title
      property :description
      property :status
      property :create_user_id
      property :updated_user_id

      validates :title, presence: true, unique: true
      validates :description, presence: true
    end
end