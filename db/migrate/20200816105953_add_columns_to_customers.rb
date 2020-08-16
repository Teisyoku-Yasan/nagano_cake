class AddColumnsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name_kana, :string, null: false, default: ""
    add_column :customers, :first_name_kana, :string, null: false, default: ""
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_name, :string, null: false, default: ""
    add_column :customers, :postal_code, :string, null: false, default: ""
    add_column :customers, :street_address, :string, null: false, default: ""
    add_column :customers, :phone_num, :string, null: false, default: ""
    add_column :customers, :is_deleted, :boolean, null: false, default: false
  end
end
