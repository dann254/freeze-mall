class Shop < ApplicationRecord
  belongs_to :user
  validates :name, presence: true,
                      length: {minimum: 3, maximum: 250},
                      format: {with: /\A[a-z0-9\-_]+\z/}
  validates :description, presence: true,
                      length: {minimum: 10, maximum: 10000}
  validates :country, presence: true, if: :is_valid_country?
  validates :payment, presence: true, if: :is_valid_payment?
  validates :city, presence: true,
                      length: {minimum: 2, maximum: 250}
  validates :account, presence: true,
                      length: {minimum: 3, maximum: 30}
  private
    def is_valid_country?
      if country != "Kenya"
          errors.add(:country, "is invalid")
      end
    end
    def is_valid_payment?
      if payment != "mpesa"
          errors.add(:payment, "is invalid")
      end
    end
end
