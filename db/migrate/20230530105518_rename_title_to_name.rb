class RenameTitleToName < ActiveRecord::Migration[7.0]
  def change
    rename_column(:genres, :title, :name)
  end
end
