# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_504_161_101) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'favorite_movies', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'image_url'
    t.integer 'year'
    t.boolean 'watched'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_favorite_movies_on_user_id'
  end

  create_table 'genres', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_genres_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'login'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'favorite_movies', 'users'
  add_foreign_key 'genres', 'users'
end
