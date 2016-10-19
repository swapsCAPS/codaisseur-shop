class AddPhotoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :photo, :string, :default => "http://res.cloudinary.com/pvdh/image/upload/v1476892920/Incognito_Search_Large_Logo_rofhta.jpg"
  end
end
