def cadastro_exame(endpoint, exameBDD)
  @header = {
    'Content-Type': "application/json",
  }

  @body = {
    codigo: "#{exameBDD}",
    codigoInterface: "COD A",
    material: "SORO",
    equipamento: "SIEMENS",
  }.to_json

  return HTTParty.post(endpoint, headers: @header, body: @body)
end
