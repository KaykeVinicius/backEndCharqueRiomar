class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :cpf
      t.string :password_digest
      t.references :tipo_usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
