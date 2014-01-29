class AddConexaoIdToTarefa < ActiveRecord::Migration
  def change
    add_column :tarefas, :conexao_id, :integer
  end
end
