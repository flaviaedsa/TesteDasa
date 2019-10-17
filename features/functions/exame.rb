def cadastro_exame(endpoint, equipamentoBDD, exameBDD, materialBDD)
  @header = {
    'Content-Type': "application/json",
  }

  @body = {
    codigo: "#{exameBDD}",
    codigoInterface: "COD A",
    material: "#{materialBDD}",
    equipamento: "#{equipamentoBDD}",
  }.to_json

  return HTTParty.post(endpoint, headers: @header, body: @body)
end

# def obter_exames
#   endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/exames/all"

#   @header = {
#     'Content-Type': "application/json",
#   }

#   return HTTParty.get(endpoint, headers: @header)
# end

def delete_exame(exames)
  endpoint = "http://contigencia-hospitalar-dev.azurewebsites.net/exames"
  body = { codigo: "#{exames}" }.to_json
  result = HTTParty.delete(endpoint, headers: @header, body: body)
  expect(result.response.code).to eql "200"
end
