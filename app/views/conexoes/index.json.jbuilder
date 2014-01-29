json.array!(@conexoes) do |conexao|
  json.extract! conexao, :id, :descricao, :adapter, :host, :username, :password, :database
  json.url conexao_url(conexao, format: :json)
end
