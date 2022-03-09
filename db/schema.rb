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

ActiveRecord::Schema[7.0].define(version: 2022_03_09_201042) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasus", force: :cascade do |t|
    t.string "document_id"
    t.string "paciente_id"
    t.string "paciente_endereco_nmPais"
    t.string "paciente_enumSexoBiologico"
    t.string "paciente_racaCor_valor"
    t.string "paciente_idade"
    t.string "paciente_endereco_uf"
    t.string "paciente_endereco_nmMunicipio"
    t.integer "paciente_endereco_coIbgeMunicipio"
    t.string "estabelecimento_municipio_nome"
    t.string "estabelecimento_uf"
    t.string "estabelecimento_razaoSocial"
    t.string "estalecimento_noFantasia"
    t.string "vacina_nome"
    t.string "vacina_lote"
    t.string "vacina_grupoAtendimento_nome"
    t.string "vacina_descricao_dose"
    t.datetime "vacina_dataAplicacao"
    t.string "vacina_fabricante_nome"
    t.string "vacina_categoria_nome"
  end

end
