def cadastro_equipamento(endpoint, equipamentoBDD)
    @header = {
        'Content-Type': 'application/json'            
         }
                    
     @body = {
                nome: "#{equipamentoBDD}",
                ip: "172.168.1.2",
                porta: 8080,
                protocolo: "ASTM",
                bidirecional: true,
                fazQuery: true,
                ativo: true,
                conectado: false,
                forcarConexaoDigiboard: true
         }.to_json       
         
      return HTTParty.post(endpoint, headers: @header, body: @body)  
 
end

def obter_equipamentos
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos/all'

    @header = {
        'Content-Type': 'application/json'            
         }   
         
     return HTTParty.get(endpoint, headers: @header)     
end

def delete_all(equipamentos)
    puts equipamentos
    puts "***********"
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos'
    if equipamentos != nil
     count = equipamentos.count
     puts count
     puts "***********"
     count.times do
      count = count - 1
      result = HTTParty.delete(endpoint, headers: @header, body: @body)
    #   expect(result.response.code).to eql "200"
     end
  end
end
    

