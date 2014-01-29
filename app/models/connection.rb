module Connection
	def with_connection
		self.seletor.camelize.constantize.establish_connection(:adapter  => self.conexao.adapter,
												:host     => self.conexao.host,
												:username => self.conexao.username,
												:password => self.conexao.password,
												:database => self.conexao.database)
		retorno = yield

		ActiveRecord::Base.establish_connection(:development)
		retorno 
	end
end