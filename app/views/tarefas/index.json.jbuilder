json.array!(@tarefas) do |tarefa|
  json.extract! tarefa, :id, :descricao, :acao, :seletor, :conexao
  json.url tarefa_url(tarefa, format: :json)
end
