class CreateMoocs < ActiveRecord::Migration
  def change
    create_table :moocs do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
