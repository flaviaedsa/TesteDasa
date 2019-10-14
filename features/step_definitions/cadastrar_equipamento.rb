Dado("que acessei API de Hospital Contingencia para o cadastro de equipamento") do
    # endpoint = $api["end_equipamento"]
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos'
end
  
Quando("faço uma chamada do tipo POST para o endpoint \/equipamentos") do
    @equipamento = cadastro_equipamento
end
  
Então("devo receber o codigo {int} para equipamento cadastrado com sucesso") do |codigo|
     expect(@equipamento.code).to eql 200
end
  
Então("devo visualizar a mensagem  com o {string} do equipamento inserido com sucesso") do |nome|
     expect(@equipamento.parsed_response).to eql "Equipamento '#{nome}' inserido com sucesso."
end