Dado("que acessei API de Hospital Contingencia para o cadastro de exames") do
    # endpoint = $api["end_exame"]
    @endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/exames'
end

Dado("tenho um equipamente cadastrado") do
    @equipamento = cadastro_equipamento
end
  
Dado("não tenho um equipamento cadastrado") do
    @equipamento = cadastro_equipamento
    HTTParty.delete(@endpoint, headers: @header, body: @body) 
end

Quando("faço uma chamada do tipo POST para o endpoint \/exames") do
    @exame = cadastro_exame
end

Então("devo receber o codigo {int} para exame cadastrado com sucesso") do |codigo|
     expect(@exame.code).to eql 200
end

Então("devo receber o codigo {int} para exame não cadastrado") do |codigo|
    expect(@exame.code).to eql 412
end
  
Então("devo visualizar a mensagem  com o {string} do exame inserido com sucesso") do |nome|
    expect(@exame.parsed_response).to eql "Exame '#{nome}' inserido com sucesso."
end

Então("devo visualizar a mensagem  com o {string} do exame que precisa ser cadastrado") do |string|
    expect(@exame.parsed_response).to eql "Você tentou cadastrar um exame para um equipamento que não existe, primeiro cadastre o equipamento '#{equipamento}'!"
end