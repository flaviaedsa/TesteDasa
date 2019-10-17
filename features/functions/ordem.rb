def cadastro_ordem(endpoint, equipamentoBDD, exame1BDD, exame2BDD, exame3BDD, exame4BDD)
  @header = {
    'Content-Type': "application/json",
  }

  @body = {
    nome: "FLAVIA DA SILVA",
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
  endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/ordens/#{nome}"
  puts endpoint

  #   @header = {
  #     'Content-Type': "application/json",
  #   }

  resultado = HTTParty.get(endpoint)
  puts resultado
end
