class CreateProducts < ActiveRecord::Migration[5.2]
  def up
    create_table :products do |t|
      t.string :name
      t.string :price

      t.timestamps
    end

    create_table :images do |t|
      t.string :image_url

      t.timestamps
    end

    create_table(:product_images, :id => false) do |t|
      t.references :product
      t.references :image
    end

  end

  def down
    drop_table :products
    drop_table :images
    drop_table :product_images
  end
end
