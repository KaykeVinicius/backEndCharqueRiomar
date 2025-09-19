class CreateTiposUsuarios < ActiveRecord::Migration[8.0]
  def change
    create_table :tipos_usuarios do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
