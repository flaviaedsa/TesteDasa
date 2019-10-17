Dado("que eu tenha um equipamento cadastrado:") do |table|
  @equipamentoBDD = table.rows_hash
  @endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos"
  @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD["nome"])
  expect(@equipamento.code).to eql 200
end

Dado("tenha os seguintes exames para cadastrar:") do |table|
  @exameBDD = table.rows_hash
end

Quando("faço uma chamada do tipo POST para o endpoint de cadastro de exames") do
  @endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/exames"
  @exame = cadastro_exame(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame"], @exameBDD["material"])
end

Então("devo receber o codigo {int} para exame cadastrado com sucesso") do |status_code|
  expect(@exame.code).to eql status_code
end

Então("devo visualizar a mensagem  com o {string} do exame inserido com sucesso") do |exame|
  expect(@exame.parsed_response).to eql "Exame '#{exame}' inserido com sucesso."
  @delete = delete_exame(@exameBDD["exame"])
  @delete = delete_equipamento(@equipamentoBDD["nome"])
end
