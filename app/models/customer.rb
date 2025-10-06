class Customer < ApplicationRecord
    validates :first_name, :last_name, :phone_number, presence: true
    validates :phone_number, format: { with: /\A\d+\z/, message: "only allows numbers" }
end
