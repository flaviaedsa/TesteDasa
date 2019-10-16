
Before do
  todosEquipamentos = obter_equipamentos
  equipamentos = todosEquipamentos.map { |i| i["nome"] }
  @delete = delete_all(equipamentos)
end
