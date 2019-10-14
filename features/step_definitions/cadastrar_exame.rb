Dado("que acessei API de Hospital Contingencia para o cadastro de exames") do
    # endpoint = $api["end_exame"]
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/exames'
end

Quando("faço uma chamada do tipo POST para o endpoint \/exames") do
    @exame = cadastro_exame
end

Então("devo receber o codigo {int} para exame cadastrado com sucesso") do |codigo|
    expect(@exame.code).to eql 200
end
  
Então("devo visualizar a mensagem  com o {string} do exame inserido com sucesso") do |nome|
    expect(@exame.parsed_response).to eql "Exame '#{nome}' inserido com sucesso."
end