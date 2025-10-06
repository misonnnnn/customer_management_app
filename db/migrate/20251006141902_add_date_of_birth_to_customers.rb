class AddDateOfBirthToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :date_of_birth, :date
  end
end
