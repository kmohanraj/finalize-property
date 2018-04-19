class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :desc
      t.float :price
      t.float :price_sqft
      t.string :bhk
      t.integer :bedroom
      t.integer :bathroom
      t.integer :toilet
      t.integer :size
      t.string :locality
      t.string :city
      t.date :start_date
      t.date :end_date
      t.string :status
      t.string :property_status
      t.string :property_type
      t.string :sales_type
      t.string :project_address
      t.string :image
      t.string :builder_name
      t.integer :category_id

      t.timestamps
    end
  end
end
