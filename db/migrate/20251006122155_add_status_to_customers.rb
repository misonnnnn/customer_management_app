class AddStatusToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :status, :string, default: "active"
  end
end
