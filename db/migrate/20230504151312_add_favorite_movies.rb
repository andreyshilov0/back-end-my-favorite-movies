class AddFavoriteMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_movies do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :year
      t.boolean :watched

      t.timestamps
    end
  end
end

