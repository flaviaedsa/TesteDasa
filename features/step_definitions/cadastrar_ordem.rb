Dado("tenha os seguintes exames cadastrados:") do |table|
  @exameBDD = table.rows_hash
  @endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/exames"
  @exame = cadastro_exame(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame1"], @exameBDD["material1"])
  @exame = cadastro_exame(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame2"], @exameBDD["material1"])
  @exame = cadastro_exame(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame3"], @exameBDD["material2"])
  @exame = cadastro_exame(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame4"], @exameBDD["material3"])
  expect(@exame.code).to eql 200
end

Quando("faço uma chamada do tipo POST para o endpoint de cadastro de ordens") do
  @endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/ordens"
  @ordem = cadastro_ordem(@endpoint, @equipamentoBDD["nome"], @exameBDD["exame1"], @exameBDD["exame2"], @exameBDD["exame3"], @exameBDD["exame4"])
end

Então("devo receber o codigo {string} visualizar as ordens") do |codigo|
  expect(@ordem.code).to eql 200
end

Então("devo visualizar uma ordem com {int} amostras") do |ordem|
  @todas_ordens = obter_ordens(@ordem["nome"])
  puts @todas_ordens
end

Então("devo visualizar uma ordem com {int} exames que possuem o mesmo material") do |ordem|
end

Então("devo visualizzar uma ordem para cada exame de material distinto") do
  @delete = delete_exame(@exameBDD["exame1"])
  @delete = delete_exame(@exameBDD["exame2"])
  @delete = delete_exame(@exameBDD["exame3"])
  @delete = delete_exame(@exameBDD["exame4"])
  @delete = delete_equipamento(@equipamentoBDD["nome"])
end
