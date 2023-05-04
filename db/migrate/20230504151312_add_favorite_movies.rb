class AddFavoriteMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_movies do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.integer :year
      t.boolean :watched
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

