class AddMoocRefToVideos < ActiveRecord::Migration
  def change
    add_reference :videos, :mooc, index: true, foreign_key: true
  end
end
