# Before  do
#         endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/exames'
    
#         @header = {
#             'Content-Type': 'application/json'            
#              }
                        
#          @body = {     
#                 nome: "GLICO"
#              }.to_json       
             
#          HTTParty.delete(endpoint, headers: @header, body: @body)  
         
#          endpoint = 'http://contigencia-hospitalar-dev.azurewebsites.net/equipamentos'
    
#          @header = {
#              'Content-Type': 'application/json'            
#               }
                         
#           @body = {     
#                  nome: "SIEMENS"
#               }.to_json       
              
#           HTTParty.delete(endpoint, headers: @header, body: @body)  
# end