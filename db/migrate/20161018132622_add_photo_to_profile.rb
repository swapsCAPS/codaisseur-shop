class AddPhotoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :photo, foreign_key: true
  end
end
