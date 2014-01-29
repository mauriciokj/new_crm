module Connection
	def with_connection
		conexao_original_conexao = Conexao.find_by_database('new_crm_development')
		self.seletor.camelize.constantize.establish_connection(:adapter  => self.conexao.adapter,
												:host     => self.conexao.host,
												:username => self.conexao.username,
												:password => self.conexao.password,
												:database => self.conexao.database)
		retorno = yield

		ActiveRecord::Base.establish_connection(:adapter  => conexao_original_conexao.adapter,
												:host     => conexao_original_conexao.host,
												:username => conexao_original_conexao.username,
												:password => conexao_original_conexao.password,
												:database => conexao_original_conexao.database)
		retorno 
	end
end