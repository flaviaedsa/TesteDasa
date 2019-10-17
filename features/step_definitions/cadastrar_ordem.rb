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

Então("devo receber o codigo {int} visualizar as ordens") do |status_code|
  expect(@ordem.code).to eql status_code
end

Então("devo visualizar uma ordem com {int} amostras") do |amostras|
  @todas_ordens = obter_ordens(@ordem["nome"])
  expect(@todas_ordens[0]["amostras"].count).to eql amostras
end

Então("devo visualizar uma amostra com {int} exames que possuem o mesmo material") do |exames|
  expect((@todas_ordens[0]["amostras"][0]["exames"]).count).to eql exames
  expect(@todas_ordens[0]["amostras"][0]["material"]).to eql @exameBDD["material1"]
  expect(@todas_ordens[0]["amostras"][0]["exames"][0]["codigo"]).to include @exameBDD["exame1"]
  expect(@todas_ordens[0]["amostras"][0]["exames"][1]["codigo"]).to include @exameBDD["exame2"]
end

Então("devo visualizar uma amostra para cada exame de material distinto") do
  expect(@todas_ordens[0]["amostras"][1]["material"]).to eql @exameBDD["material2"]
  expect(@todas_ordens[0]["amostras"][1]["exames"][0]["codigo"]).to eql @exameBDD["exame3"]
  expect(@todas_ordens[0]["amostras"][2]["material"]).to eql @exameBDD["material3"]
  expect(@todas_ordens[0]["amostras"][2]["exames"][0]["codigo"]).to eql @exameBDD["exame4"]
  @delete = delete_exame(@exameBDD["exame1"])
  @delete = delete_exame(@exameBDD["exame2"])
  @delete = delete_exame(@exameBDD["exame3"])
  @delete = delete_exame(@exameBDD["exame4"])
  @delete = delete_equipamento(@equipamentoBDD["nome"])
end
