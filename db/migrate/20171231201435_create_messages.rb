class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :locality
      t.text :desc
      t.string :phone
      t.string :price_range
      t.integer :user_id

      t.timestamps
    end
  end
end
