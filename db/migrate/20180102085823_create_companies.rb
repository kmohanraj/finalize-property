class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.text :address
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
