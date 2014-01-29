class CreateConexoes < ActiveRecord::Migration
  def change
    create_table :conexoes do |t|
      t.string :descricao
      t.string :adapter
      t.string :host
      t.string :username
      t.string :password
      t.string :database

      t.timestamps
    end
  end
end
