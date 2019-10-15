# # Before do 
# #     @equipamentos = obter_equipamentos
# #     puts @equipamentos

# #     equipamentos = @equipamentos.map{ |i| i['nome']}
# #     puts "*****"
# #     puts equipamentos

# #     # HTTParty.delete(endpoint, headers: @header, body: @body)     
# # end

Before do
    todosEquipamentos = obter_equipamentos
    equipamentos = todosEquipamentos.map{ |i| i['nome']}
    @delete = delete_all(equipamentos)
end


