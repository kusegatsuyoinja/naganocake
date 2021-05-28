class RenamePurductIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :product_id, :item_id
  end
end
