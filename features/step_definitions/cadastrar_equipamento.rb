Dado("que eu tenha os seguintes equipamentos:") do |table|
  @equipamentoBDD = table.rows_hash
end

Quando("faço uma chamada do tipo POST para o endpoint de cadastro de equipamentos") do
  @endpoint = "#{CONFIG["apis"]["base_url"]}#{CONFIG["apis"]["equipamentos"]}"
  @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD["nome"], @equipamentoBDD["protocolo"])
end

Então("devo receber o codigo {int} para equipamento cadastrado com sucesso") do |status_code|
  expect(@equipamento.code).to eql status_code
end

Então("devo visualizar a mensagem  com o {string} do equipamento inserido com sucesso") do |nome|
  expect(@equipamento.parsed_response).to eql "Equipamento '#{nome}' inserido com sucesso."
  @delete = delete_equipamento(@equipamentoBDD["nome"])
end

#-----------------------------------------------------------------------------------------------------#

Dado("que eu tenha os seguintes equipamentos cadastrados:") do |table|
  @equipamentoBDD = table.rows_hash
  @endpoint = "#{CONFIG["apis"]["base_url"]}#{CONFIG["apis"]["equipamentos"]}"
  @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD["nome"], @equipamentoBDD["protocolo"])
  expect(@equipamento.code).to eql 200
end

Quando("faço uma chamada do tipo POST passando equipamentos ja cadastrados") do
  @equipamentojacadastrado = cadastro_equipamento(@endpoint, @equipamentoBDD["nome"], @equipamentoBDD["protocolo"])
end

Então("devo receber o codigo {int} para equipamento ja existente") do |status_code|
  expect(@equipamentojacadastrado.code).to eql status_code
end

Então("devo visualizar a mensagem  com o {string} do equipamento ja cadastrado") do |nome|
  expect(@equipamentojacadastrado.parsed_response).to eql "O cadastro do equipamento '#{nome}' já existe!"
  @delete = delete_equipamento(@equipamentoBDD["nome"])
end

#----------------------------------------------------------------------------------------------------#

Dado("que eu queira cadastrar equipamento com protocolo inexistente:") do |table|
  @equipamentoBDD = table.rows_hash
  @endpoint = "#{CONFIG["apis"]["base_url"]}#{CONFIG["apis"]["equipamentos"]}"
  @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD["nome"], @equipamentoBDD["protocolo"])
end

Então("devo receber o codigo {int} para protocolo nao suportado") do |status_code|
  expect(@equipamento.code).to eql status_code
end

Então("devo visualizar a mensagem  de {string} nao suportado") do |protocolo|
  expect(@equipamento.parsed_response).to eql "Protocolo '#{protocolo}' não suportado! Lista de protocolos: [{'protocolo': 'ASTM'}]."
end
