class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :expert
      t.string :category
      t.string :subcategory
      t.string :date

      t.timestamps null: false
    end
  end
end
