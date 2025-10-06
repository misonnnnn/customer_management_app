class Customer < ApplicationRecord
    enum :status, { active: "active", inactive: "inactive" }, default: "active"

    validates :first_name, :last_name, :phone_number, presence: true
    validates :first_name, :last_name, length: { maximum: 50 }
    validates :phone_number, format: { with: /\A\d+\z/, message: "only allows numbers" }
    validates :phone_number, uniqueness: true

    def full_name
        "#{first_name} #{last_name}"
    end

    scope :active, -> { where(status: "active") }
    scope :inactive, -> { where(status: "inactive") }
    scope :recent, -> { order(created_at: :desc) }
end
