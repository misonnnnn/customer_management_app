require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h6", text: "CUSTOMERS"
    assert_selector "table"
  end

  test "should create customer" do
    visit customers_url
    click_on "Add New Customer"

    fill_in "Email", with: "unique_#{SecureRandom.hex(4)}@example.com"
    fill_in "First name", with: "test_#{SecureRandom.hex(4)}"
    fill_in "Last name", with: "test_#{SecureRandom.hex(4)}"
    fill_in "Phone number", with: "099988888"
    fill_in "Date of birth", with: "1990-01-01"
    click_on "Save Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit customer_url(@customer)
    click_on "Edit", match: :first

    fill_in "Email", with: @customer.email
    fill_in "First name", with: @customer.first_name
    fill_in "Last name", with: @customer.last_name
    fill_in "Phone number", with: @customer.phone_number
    fill_in "Date of birth", with: @customer.date_of_birth
    click_on "Save Customer"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should delete Customer" do
    visit customer_url(@customer)
    accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Customer was successfully deleted"
  end
end
