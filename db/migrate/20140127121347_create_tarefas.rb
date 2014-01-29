class CreateTarefas < ActiveRecord::Migration
  def change
    create_table :tarefas do |t|
      t.string :descricao
      t.string :acao
      t.string :seletor

      t.timestamps
    end
  end
end
