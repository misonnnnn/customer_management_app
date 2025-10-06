class Customer < ApplicationRecord
    enum :status, { active: "active", inactive: "inactive" }, default: "active"

    validates :first_name, :last_name, :phone_number, :status, :date_of_birth, presence: true
    validates :first_name, :last_name, :phone_number, length: { maximum: 50 }
    validates :phone_number, format: { with: /\A\d+\z/, message: "only allows numbers" }
    validates :phone_number, :email, uniqueness: true
    validate :date_of_birth_cannot_be_in_the_future
    validates :email, presence: true, format: { 
        with: /\A[^@\s]+@[^@\s]+\z/, 
        message: "must be a valid email address" 
    }

    def full_name
        "#{first_name} #{last_name}"
    end

    def date_of_birth_cannot_be_in_the_future
        return if date_of_birth.blank?

        dob = date_of_birth.is_a?(String) ? Date.parse(date_of_birth) : date_of_birth.to_date
        Rails.logger.debug "DEBUG: validating date_of_birth parsed = #{dob} vs today #{Date.current}"

        if dob > Date.current
            errors.add(:date_of_birth, "can't be in the future")
        end
    end

    scope :active, -> { where(status: "active") }
    scope :inactive, -> { where(status: "inactive") }
    scope :recent, -> { order(created_at: :desc) }
end
