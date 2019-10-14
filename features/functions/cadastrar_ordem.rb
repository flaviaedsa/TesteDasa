def cadastro_ordem
    endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/ordens'

    @header = {
        'Content-Type': 'application/json'            
         }
                    
     @body = {
            nome: "FULANO DA SILVA",
            nascimento: "13/11/1988",
            sexo: "M",
            leito: "Leito A",
            centroDeOrigem: "Centro A",
            exames: [
            {"codigo": "GLICO"}, {"codigo": "TSH"}
            ] 
         }.to_json       
         
     return HTTParty.post(endpoint, headers: @header, body: @body)    
end