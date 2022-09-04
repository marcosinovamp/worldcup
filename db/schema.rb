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

ActiveRecord::Schema[7.0].define(version: 2022_09_03_192104) do
  create_table "confederations", force: :cascade do |t|
    t.string "nome"
    t.integer "jg"
    t.integer "pt"
    t.integer "vt"
    t.integer "ep"
    t.integer "dr"
    t.integer "gp"
    t.integer "gc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jogos", force: :cascade do |t|
    t.integer "equipe1"
    t.integer "equipe2"
    t.integer "g1"
    t.integer "g2"
    t.integer "p1"
    t.integer "p2"
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grupo_id"
    t.index ["grupo_id"], name: "index_jogos_on_grupo_id"
  end

  create_table "selecaos", force: :cascade do |t|
    t.string "nome"
    t.string "continente"
    t.string "bandeira"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "grupo_id"
    t.integer "confederation_id"
    t.index ["confederation_id"], name: "index_selecaos_on_confederation_id"
    t.index ["grupo_id"], name: "index_selecaos_on_grupo_id"
  end

end
