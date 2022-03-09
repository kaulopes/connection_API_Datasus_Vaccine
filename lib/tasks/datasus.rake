namespace :datasus do
    desc 'Buscando dados de vacinas no DataSUS'
    task get_data_vacinas: :environment do
        require "uri"
        require "json"
        require "net/http"

        url = URI("https://imunizacao-es.saude.gov.br/_search")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Authorization"] = "Basic aW11bml6YWNhb19wdWJsaWM6cWx0bzV0JjdyX0ArI1Rsc3RpZ2k="
        request["Content-Type"] = "application/json"
        request["Cookie"] = "ELASTIC-PROD=1638883905.916.750.974240"
        request.body = JSON.dump({
            "size": 10
        })

        response = https.request(request)
        data= JSON.parse(response.read_body)
        data['hits']['hits'].each do |item| 
            dsaux = item['_source']
            datasus = Datasu.where(vacina_dataAplicacao: dsaux['vacina_dataAplicacao'].to_datetime, document_id: dsaux['document_id'], paciente_id: dsaux['paciente_id'])
            if datasus.blank?
                datasus = Datasu.new
                datasus.document_id = dsaux['document_id']
                datasus.paciente_id = dsaux['paciente_id']
                datasus.paciente_endereco_nmPais = dsaux['paciente_endereco_nmPais']
                datasus.paciente_enumSexoBiologico = dsaux['paciente_enumSexoBiologico']
                datasus.paciente_racaCor_valor = dsaux['paciente_racaCor_valor']
                datasus.paciente_idade = dsaux['paciente_idade']
                datasus.paciente_endereco_uf = dsaux['paciente_endereco_uf']
                datasus.paciente_endereco_nmMunicipio = dsaux['paciente_endereco_nmMunicipio']
                datasus.paciente_endereco_coIbgeMunicipio = dsaux['paciente_endereco_coIbgeMunicipio']
                datasus.estabelecimento_municipio_nome = dsaux['estabelecimento_municipio_nome']
                datasus.estabelecimento_uf = dsaux['estabelecimento_uf']
                datasus.estabelecimento_razaoSocial = dsaux['estabelecimento_razaoSocial']
                datasus.estalecimento_noFantasia = dsaux['estalecimento_noFantasia']
                datasus.vacina_nome = dsaux['vacina_nome']
                datasus.vacina_lote = dsaux['vacina_lote']
                datasus.vacina_grupoAtendimento_nome = dsaux['vacina_grupoAtendimento_nome']
                datasus.vacina_descricao_dose = dsaux['vacina_descricao_dose']
                datasus.vacina_dataAplicacao = dsaux['vacina_dataAplicacao']
                datasus.vacina_fabricante_nome = dsaux['vacina_fabricante_nome']
                datasus.vacina_categoria_nome = dsaux['vacina_categoria_nome']
                datasus.save
            end
        end
    end
  end
