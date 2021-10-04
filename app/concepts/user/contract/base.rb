module User::Contract
  class Base < Reform::Form
    property :name
    property :email
    property :password_digest
    property :profile
    property :role
    property :phone
    property :address
    property :dob
    property :create_user_id
    property :updated_user_id
    property :deleted_user_id
    property :deleted_at

    validates :name, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :profile, 
              :role,
              :create_user_id,
              :updated_user_id, presence: true
  end
end