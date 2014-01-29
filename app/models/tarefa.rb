include Connection
class Tarefa < ActiveRecord::Base

	belongs_to :conexao

	def method_missing(method, *args) 
    	super if respond_to_without_attributes?(method, true) # returns true when attr accessors

	    if respond_to? method
	      send(method,*args)
	    else
	      	with_connection do
				self.seletor.camelize.constantize.seletor
			end
	    end 
    end 

end
