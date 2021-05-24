class RenamePurductIdColumnToCartItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :product_id, :item_id
  end
end
