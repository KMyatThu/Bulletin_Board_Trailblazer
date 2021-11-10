module User::Contract
  class Base < Reform::Form
    property :name
    property :email
    property :password
    property :password_confirmation
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
    # validates :email, presence: true, length: { maximum: 100 },
    #                   format: { with: URI::MailTo::EMAIL_REGEXP },
    #                   unique: true
    validates :password, presence: true, confirmation: true
    validates :profile,
              :role,
              :create_user_id,
              :updated_user_id, presence: true
  end
end