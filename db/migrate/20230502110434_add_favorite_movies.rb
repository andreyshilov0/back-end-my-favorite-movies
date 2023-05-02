class AddFavoriteMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :year

      t.timestamps
    end
  end
end
