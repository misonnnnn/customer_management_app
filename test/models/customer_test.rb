require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  def setup
    @customer = customers(:one)
  end

  test "should be valid with valid attributes" do
    assert @customer.valid?
  end

  test "should be invalid without first name" do
    @customer.first_name = nil
    assert_not @customer.valid?
    assert_includes @customer.errors[:first_name], "can't be blank"
  end

  test "should be invalid without last name" do
    @customer.last_name = nil
    assert_not @customer.valid?
    assert_includes @customer.errors[:last_name], "can't be blank"
  end

  test "should be invalid if date_of_birth is in the future" do
    @customer.date_of_birth = Date.tomorrow
    assert_not @customer.valid?, "Expected customer to be invalid when date_of_birth is in the future"
    assert_includes @customer.errors[:date_of_birth], "can't be in the future"
  end

  test "should be invalid if email is invalid" do
    @customer.email = "invalid_email"
    assert_not @customer.valid?
    assert_includes @customer.errors[:email], "must be a valid email address"
  end

  test "should be valid with 50 character first name" do
    @customer.first_name = "a" * 50
    assert @customer.valid?
  end

  test "should be invalid if first name is more than 50 characters" do
    @customer.first_name = "a" * 51
    assert_not @customer.valid?
    assert_includes @customer.errors[:first_name], "is too long (maximum is 50 characters)"
  end

  test "should be invalid if last name is more than 50 characters" do
    @customer.last_name = "a" * 51
    assert_not @customer.valid?
    assert_includes @customer.errors[:last_name], "is too long (maximum is 50 characters)"
  end

  test "should be invalid if phone number is more than 50 characters" do
    @customer.phone_number = Array.new(51) { rand(0..9) }.join
    assert_not @customer.valid?
    assert_includes @customer.errors[:phone_number], "is too long (maximum is 50 characters)"
  end

  test "should be invalid if phone number is not numeric" do
    @customer.phone_number = "invalid_phone"
    assert_not @customer.valid?
    assert_includes @customer.errors[:phone_number], "only allows numbers"
  end

  
end
