class AddPhotoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_reference :profiles, :photo, foreign_key: true, default: "http://gazettereview.com/wp-content/uploads/2016/03/facebook-avatar.jpg"
  end
end
