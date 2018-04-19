class CreateNewsFeeds < ActiveRecord::Migration[5.1]
  def change
    create_table :news_feeds do |t|
      t.string :name
      t.integer :property_id
      t.integer :category_id
      t.date :start_date
      t.date :end_date
      t.string :offer
      t.text :description

      t.timestamps
    end
  end
end
