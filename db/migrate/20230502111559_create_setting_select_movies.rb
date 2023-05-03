# frozen_string_literal: true

class CreateSettingSelectMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :setting_select_movies do |t|
      t.string :genres
      t.string :popularity
      t.integer :year

      t.timestamps
    end
  end
end
