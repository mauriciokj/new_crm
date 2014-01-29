
class OuvidoriaCategoriaSeletor < ActiveRecord::Base
	self.table_name = "categorias"
	self.abstract_class = true
	

	def self.seletor
		OuvidoriaCategoriaSeletor.all
	end
end


