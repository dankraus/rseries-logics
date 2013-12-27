# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131227012738) do

  create_table "colors", force: true do |t|
    t.string   "hex"
    t.integer  "r"
    t.integer  "g"
    t.integer  "b"
    t.integer  "hue"
    t.integer  "sat"
    t.integer  "val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors_palettes", force: true do |t|
    t.integer  "color_id"
    t.integer  "palette_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colors_palettes", ["color_id", "palette_id"], name: "index_colors_palettes_on_color_id_and_palette_id", using: :btree

  create_table "palettes", force: true do |t|
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
