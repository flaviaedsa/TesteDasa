Dado("que eu tenha os seguintes exames:") do |table|
    @exameBDD = table.rows_hash
end
 
Quando("faço uma chamada do tipo POST para o endpoint de cadastro de exames") do
    @endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/exames'
    @exame = cadastro_exame(@endpoint, @exameBDD['nome'])
end
  
Então("devo receber o codigo {string} para exame cadastrado com sucesso") do |codigo|
    expect(@exame.code).to eql 200
end

Então("devo visualizar a mensagem  com o {string} do exame inserido com sucesso") do |nome|
    expect(@exame.parsed_response).to eql "Exame '#{nome}' inserido com sucesso."
end