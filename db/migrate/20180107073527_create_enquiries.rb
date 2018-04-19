class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :phone
      t.string :purpose
      t.string :locality

      t.timestamps
    end
  end
end
