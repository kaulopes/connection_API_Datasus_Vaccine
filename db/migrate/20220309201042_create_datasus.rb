class CreateDatasus < ActiveRecord::Migration[7.0]
  def change
    create_table :datasus do |t|
      t.string :document_id
      t.string :paciente_id
      t.string :paciente_endereco_nmPais
      t.string :paciente_enumSexoBiologico
      t.string :paciente_racaCor_valor
      t.string :paciente_idade
      t.string :paciente_endereco_uf
      t.string :paciente_endereco_nmMunicipio
      t.integer :paciente_endereco_coIbgeMunicipio
      t.string :estabelecimento_municipio_nome
      t.string :estabelecimento_uf
      t.string :estabelecimento_razaoSocial
      t.string :estalecimento_noFantasia
      t.string :vacina_nome
      t.string :vacina_lote
      t.string :vacina_grupoAtendimento_nome
      t.string :vacina_descricao_dose
      t.datetime :vacina_dataAplicacao
      t.string :vacina_fabricante_nome
      t.string :vacina_categoria_nome
    end
  end
end
