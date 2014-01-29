#Funcionamento basico do NEW_CRM

o prototipo ja está com o devise para controle de usuarios, pois eu estava fazendo alguns testes com a conexão dependendo do usuario, você pode gerar um usuario para ele ou simplesmente retirar o before_filter :authenticate_usuario! do application controller

acessando a action /conexoes eu crio a conexão que será responsavel pelo acesso ao novo banco

e acessando /tarefas eu crio uma nova tarefa, com uma descricao, uma ação e qual será o seletor

a acao por enquanto está sendo criada dinamicamente, mas provavelmente será algo previamente programado


já o seletor deve ter o mesmo nome do arquivo que será a classe seletora.

para que não haja uma repeticao de classes, eu usei como padrao usar o nome do sistema que sera acessado, a classe nova finalizando com seletor
exemplo, para ter uma classe que busque os chamados no sistema de ouvidoria o seletor se chamaria ouvidoria_chamado_seletor 
selecionar a conexao

dentro da pasta app/seletores eu teria um arquivo chamado ouvidoria_chamado_seletor.rb

com uma classe com a seguinte extrutura

class OuvidoriaChamadoSeletor < ActiveRecord::Base
	self.table_name = "chamados" //definindo a tabela que acessaria dentro do ouvidoria
	self.abstract_class = true
	

	belongs_to :categoria, :class_name=> "OuvidoriaCategoriaSeletor", :foreign_key => 'categoria_id' //definicoes do relacionamento

	//metodo obrigatorio para a classe que traria o resultado, nesse caso todos os chamados
	def self.seletor 
		OuvidoriaChamadoSeletor.all
	end
end

para facilitar ja enviarei um bkp do meu banco
usuario: mauriciokj@gmail.com senha: Senha123

e como ele faria para executar essa consulta dentro do banco de ouvidoria?
bom, a tarefa ja está relacionada diretamente com a conexao pre selecionada

na tela de tarefas, você possui uma action chamada executar

no controller ele vai buscar a tarefa relacionada e executar a tarefa dinamicamente
dentro da classe tarefa, fiz um method_missing para a execuçao das tarefas so por preguiça de escrever os metodos que serão as açoes

a classe Tarefa inclui a classe responsavel pelas conexoes

--include Connection

a classe Connection possui o metodo 'with_connection' responsavel pelo gerenciamento das conexoes

dentro da classe tarefa, invoco esse metodo, passando dentro do bloco 
self.seletor.camelize.constantize.seletor, que pegara o seletor definido e transformara em uma classe e executara o metodo .seletor

isso retorna os dados para meu controllher e hoje exibo eles na tela

fiz uma explicacao rapida, mas o codigo é muito simples e com certeza ficara mais simples de entender analizando por ele =D


















