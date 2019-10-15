
Dado("que acessei API de Hospital Contingencia para o cadastro de ordens") do
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/ordens'
end

Quando("faço uma chamada do tipo POST para o endpoint \/ordens") do
    @ordem = cadastro_ordem
end

Então("devo receber o codigo {int} para ordem cadastrada com sucesso") do |codigo|
    expect(@ordem.code).to eql 200
end