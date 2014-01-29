
class OuvidoriaChamadoSeletor < ActiveRecord::Base
	self.table_name = "chamados"
	self.abstract_class = true
	

	belongs_to :categoria, :class_name=> "OuvidoriaCategoriaSeletor", :foreign_key => 'categoria_id'

	def self.seletor
		OuvidoriaChamadoSeletor.all
	end
end


