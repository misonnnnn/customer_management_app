class Customer < ApplicationRecord
    enum :status, { active: "active", inactive: "inactive" }, default: "active"

    validates :first_name, :last_name, :phone_number, :date_of_birth, presence: true
    validates :first_name, :last_name, length: { maximum: 50 }
    validates :phone_number, format: { with: /\A\d+\z/, message: "only allows numbers" }
    validates :phone_number, uniqueness: true
    validate :date_of_birth_cannot_be_in_the_future

    def full_name
        "#{first_name} #{last_name}"
    end

    def date_of_birth_cannot_be_in_the_future
        if date_of_birth.present? && date_of_birth > Date.today
            errors.add(:date_of_birth, "can't be in the future")
        end
    end

    scope :active, -> { where(status: "active") }
    scope :inactive, -> { where(status: "inactive") }
    scope :recent, -> { order(created_at: :desc) }
end
