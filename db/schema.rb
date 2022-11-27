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

ActiveRecord::Schema[7.0].define(version: 2022_11_24_141026) do
  create_table "confederations", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jogo_id"
    t.integer "jogador_id"
    t.integer "treinador_id", default: 0
    t.index ["jogador_id"], name: "index_eventos_on_jogador_id"
    t.index ["jogo_id"], name: "index_eventos_on_jogo_id"
    t.index ["treinador_id"], name: "index_eventos_on_treinador_id"
  end

  create_table "grupos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jogadors", force: :cascade do |t|
    t.string "nome"
    t.string "posicao"
    t.string "status"
    t.integer "gols"
    t.integer "age"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "selecao_id"
    t.integer "foul"
    t.index ["selecao_id"], name: "index_jogadors_on_selecao_id"
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
    t.boolean "started", default: false
    t.index ["grupo_id"], name: "index_jogos_on_grupo_id"
  end

  create_table "red_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jogo_id"
    t.integer "jogador_id"
    t.integer "treinador_id", default: 0
    t.index ["jogador_id"], name: "index_red_cards_on_jogador_id"
    t.index ["jogo_id"], name: "index_red_cards_on_jogo_id"
    t.index ["treinador_id"], name: "index_red_cards_on_treinador_id"
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

  create_table "treinadors", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "selecao_id"
    t.index ["selecao_id"], name: "index_treinadors_on_selecao_id"
  end

  create_table "yellow_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jogo_id"
    t.integer "jogador_id"
    t.integer "treinador_id", default: 0
    t.index ["jogador_id"], name: "index_yellow_cards_on_jogador_id"
    t.index ["jogo_id"], name: "index_yellow_cards_on_jogo_id"
    t.index ["treinador_id"], name: "index_yellow_cards_on_treinador_id"
  end

end
