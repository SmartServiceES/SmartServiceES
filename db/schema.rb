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

ActiveRecord::Schema[7.0].define(version: 2023_08_17_024355) do
  create_table "clientes", force: :cascade do |t|
    t.text "nome_completo"
    t.date "data_nascimento"
    t.text "cpf"
    t.text "email"
    t.text "senha"
    t.text "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contratos", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.integer "servico_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_contratos_on_cliente_id"
    t.index ["servico_id"], name: "index_contratos_on_servico_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.text "nome_da_rua"
    t.text "numero_da_casa"
    t.text "cep"
    t.text "bairro"
    t.text "cidade"
    t.text "complemento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id", null: false
    t.index ["cliente_id"], name: "index_enderecos_on_cliente_id"
  end

  create_table "servicos", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.float "valor"
    t.string "categoria"
    t.datetime "horario_inicio"
    t.datetime "horario_termino"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "trabalhador_id", null: false
    t.boolean "contratado", default: false
    t.index ["trabalhador_id"], name: "index_servicos_on_trabalhador_id"
  end

  create_table "trabalhadors", force: :cascade do |t|
    t.string "nome_completo"
    t.string "telefone"
    t.date "data_nascimento"
    t.string "email"
    t.string "senha"
    t.string "profissao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contratos", "clientes"
  add_foreign_key "contratos", "servicos"
  add_foreign_key "enderecos", "clientes"
  add_foreign_key "servicos", "trabalhadors"
end
