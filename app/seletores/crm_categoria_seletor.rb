
class CrmCategoriaSeletor < ActiveRecord::Base
	self.table_name = "categorias"
	self.abstract_class = true
	

	def self.seletor
		CrmCategoriaSeletor.all
	end
end


