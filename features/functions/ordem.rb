def cadastro_ordem(endpoint, equipamentoBDD, exame1BDD, exame2BDD, exame3BDD, exame4BDD)
  @header = {
    'Content-Type': "application/json",
  }

  @body = {
    nome: "FABIO",
    nascimento: "13/11/1988",
    sexo: "M",
    leito: "Leito A",
    centroDeOrigem: "Centro A",
    exames: [{
      codigo: "#{exame1BDD}",
    }, {
      codigo: "#{exame2BDD}",
    }, {
      codigo: "#{exame3BDD}",
    }, {
      codigo: "#{exame4BDD}",
    }],

  }.to_json

  return HTTParty.post(endpoint, headers: @header, body: @body)
end

def obter_ordens(nome)
  endpoint = "#{CONFIG["apis"]["base_url"]}#{CONFIG["apis"]["ordens"]}/#{nome}"
  return HTTParty.get(endpoint)
end
