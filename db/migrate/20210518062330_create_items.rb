class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :name
      t.text :description
      t.integer :price
      t.boolean :is_active

      t.timestamps
    end
  end
end
