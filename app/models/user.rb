class User < ActiveRecord::Base
    has_secure_password
    has_many :kids
    has_many :events, through: :kids
    validates :name, :family_name, :email, :password_digest, presence: true
    validates :email, uniqueness: true
    validates :email, format: { with: /\A[a-zA-Z0-9.!\#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ , message: "Please enter a valid email address" }

    # def email_error_validation
    # errors.add(:email, "Please enter a valid email address")
    # end

end
