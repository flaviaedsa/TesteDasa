def cadastro_exame
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/exame'

    @header = {
        'Content-Type': 'application/json'            
         }
                    
     @body = {
                codigo: "GLICO",
                codigoInterface: "COD A",
                material: "SORO",
                equipamento: "SIEMENS"
         }.to_json       
         
     return HTTParty.post(endpoint, headers: @header, body: @body)    
end
