class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method
      t.string :delivery_postal_code
      t.string :delivery_address
      t.string :delivery_name
      t.integer :postage
      t.integer :bill
      t.integer :order_status

      t.timestamps
    end
  end
end
