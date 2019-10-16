Dado("que eu tenha os seguintes equipamentos:") do |table|
    @equipamentoBDD = table.rows_hash
    puts @equipamentoBDD
end
  
Quando("faço uma chamada do tipo POST para o endpoint de cadastro de equipamentos") do
    @endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos'
    @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD['nome'])
    puts @equipamento
end
  
Então("devo receber o codigo {string} para equipamento cadastrado com sucesso") do |codigo|
     expect(@equipamento.code).to eql 200
     puts @equipamento.code
end
  
Então("devo visualizar a mensagem  com o {string} do equipamento inserido com sucesso") do |nome|
     expect(@equipamento.parsed_response).to eql "Equipamento '#{nome}' inserido com sucesso."
     puts @equipamento.parsed_response
end

Dado("que eu tenha os seguintes equipamentos cadastrados:") do |table|
    @equipamentoBDD = table.rows_hash
    @endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos'
    @equipamento = cadastro_equipamento(@endpoint, @equipamentoBDD['nome'])
    expect(@equipamento.code).to eql 200
    puts @equipamento.code
end
  
Quando("faço uma chamada do tipo POST passando equipamentos ja cadastrados") do
    @equipamentojacadastrado = cadastro_equipamento(@endpoint, @equipamentoBDD['nome'])
    puts @equipamentojacadastrado
end
  
Então("devo receber o codigo {string} para equipamento ja existente") do |codigo|
    puts @equipamentojacadastrado.code
    expect(@equipamentojacadastrado.code).to eql 409
end
  
Então("devo visualizar a mensagem  com o {string} do equipamento ja cadastrado") do |nome|
    puts @equipamentojacadastrado.parsed_respons
    expect(@equipamentojacadastrado.parsed_response).to eql "O cadastro do equipamento '#{nome}' já existe!"
end