def cadastro_equipamento(endpoint, equipamentoBDD, protocoloBDD)
  @header = {
    'Content-Type': "application/json",
  }

  @body = {
    nome: "#{equipamentoBDD}",
    ip: "172.168.1.2",
    porta: 8080,
    protocolo: "#{protocoloBDD}",
    bidirecional: true,
    fazQuery: true,
    ativo: true,
    conectado: false,
    forcarConexaoDigiboard: true,
  }.to_json

  return HTTParty.post(endpoint, headers: @header, body: @body)
end

def delete_equipamento(equipamentos)
  endpoint = "#{CONFIG["apis"]["base_url"]}#{CONFIG["apis"]["equipamentos"]}"
  body = { nome: "#{equipamentos}" }.to_json
  result = HTTParty.delete(endpoint, headers: @header, body: body)
  expect(result.response.code).to eql "200"
end
