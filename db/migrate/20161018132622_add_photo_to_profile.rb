class AddPhotoToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :photo, :string, :default => "Incognito_Search_Large_Logo_jirmz3.jpg"
  end
end
