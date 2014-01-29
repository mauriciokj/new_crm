
class CrmChamadoSeletor < ActiveRecord::Base
	self.table_name = "chamados"
	self.abstract_class = true
	

	belongs_to :categoria, :class_name=> "CrmCategoriaSeletor", :foreign_key => 'categoria_id'

	def self.seletor
		CrmChamadoSeletor.all
	end
end


