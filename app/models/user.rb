class User < ApplicationRecord
  has_one :shop, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true,
                       length: {minimum: 3, maximum: 30},
                       format: {with: /\A[a-z0-9\-_]+\z/}
  validates :email, presence: true, email: {strict_mode: true}
  validates :role, presence: true, if: :is_valid_role?

  private
    def is_valid_role?
      if role != "merchant" && role != "buyer"
          errors.add(:Oops, "an error occurred please complete and resubmit the form")
      end
    end
end
