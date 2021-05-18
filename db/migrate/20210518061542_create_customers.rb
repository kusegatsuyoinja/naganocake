class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_ruby
      t.string :first_ruby
      t.string :email
      t.string :postal_cord
      t.string :address
      t.string :phone_number
      t.string :encrypted_password
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
