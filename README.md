#Funcionamento basico do NEW_CRM

O prototipo já está com o devise para controle de usuarios, pois eu estava fazendo alguns testes com a conexão dependendo do usuario, você pode gerar um usuario para ele ou simplesmente retirar o before_filter :authenticate_usuario! do application controller

#Usando o protótipo

* Acesse /conexoes e cria a conexão referente ao sistema que o new_crm irá genrenciar.

* Acesse /tarefas e crie uma nova tarefa, definindo: descricao, acao, seletor e conexao.

== A ação para exemplo podemos usar enviar_email, mas hoje para que não ocorram erros, o sistema aceita qualquer ação e somente exibe os dados trazidos pelo seletor.

== Em seletor você deve colocar o nome do aquivo do seu seletor iniciando com o nome do sistema que o seletor irá gerenciar, finalizando com _seletor e sem o .rb ex:
	ouvidoria_chamados_seletor

== Selecionar a conexao

#Criando um seletor

* Dentro da pasta app/seletores crie um arquivo com o mesmo nome do seletor definido na criação da tarefa.
== Herdar de ActiveRecord::Base
== Deve setar o nome da tabela que buscará as informações // self.table_name = "chamados"
== Deve obrigatoriamente ter o metodo de classe 'seletor'

ex:

```console
class OuvidoriaChamadoSeletor < ActiveRecord::Base
	self.table_name = "chamados" //definindo a tabela que acessaria dentro do ouvidoria
	self.abstract_class = true
	

	belongs_to :categoria, :class_name=> "OuvidoriaCategoriaSeletor", :foreign_key => 'categoria_id' //definicoes do relacionamento

	//metodo obrigatorio para a classe que traria o resultado, nesse caso todos os chamados
	def self.seletor 
		OuvidoriaChamadoSeletor.all
	end
end
```

para facilitar ja enviarei um bkp do meu banco
usuario: mauriciokj@gmail.com senha: Senha123


#Funcionamento do seletor

* Na tela de tarefas clique em 'Executar' e abrirá uma nova tela exibindo os dados buscados pelo seletor.

#Retornando as informações.
Ao clicar em executar, para exibir as informações o sistema executa a ação relacionada à tarefa, usando o seletor também relacionado.

#Classe tarefa

== Para evitar problemas, essa classe tem apenas um method_missing que executa qualquer ação, invocando o seletor.

== Ela inclui a classe responsavel pelas conexoes
```console	
include Connection
```

#Classe Connection
== Possui o metodo 'with_connection' responsavel pelo gerenciamento das conexoes que é invocado dentro da classe Tarefa passando dentro do bloco o código

```console	
self.seletor.camelize.constantize.seletor
```
que pegara o seletor definido e transformara em uma classe e executara o metodo .seletor

isso retornará os dados para o controllher e exibirá na tela.



fiz uma explicacao rapida, mas o codigo é muito simples e com certeza ficara mais simples de entender analizando por ele =D


















