class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :name
      t.string :phone
      t.string :locality
      t.integer :user_id
      t.string :purpose
      t.string :city

      t.timestamps
    end
  end
end
