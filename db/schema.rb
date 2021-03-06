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

ActiveRecord::Schema.define(version: 2021_02_04_195257) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "dogsitters_id"
    t.integer "dogs_id"
    t.index ["dogs_id"], name: "index_cities_on_dogs_id"
    t.index ["dogsitters_id"], name: "index_cities_on_dogsitters_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cities_id"
    t.index ["cities_id"], name: "index_dogs_on_cities_id"
  end

  create_table "dogsitters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cities_id"
    t.index ["cities_id"], name: "index_dogsitters_on_cities_id"
  end

  create_table "strolls", force: :cascade do |t|
    t.date "date"
    t.integer "dogsitter_id"
    t.integer "dog_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dog_id"], name: "index_strolls_on_dog_id"
    t.index ["dogsitter_id"], name: "index_strolls_on_dogsitter_id"
  end

  add_foreign_key "cities", "dogs", column: "dogs_id"
  add_foreign_key "cities", "dogsitters", column: "dogsitters_id"
  add_foreign_key "dogs", "cities", column: "cities_id"
  add_foreign_key "dogsitters", "cities", column: "cities_id"
  add_foreign_key "strolls", "dogs"
  add_foreign_key "strolls", "dogsitters"
end
