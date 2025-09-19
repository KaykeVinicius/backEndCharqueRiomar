class CreateSetores < ActiveRecord::Migration[8.0]
  def change
    create_table :setores do |t|
      t.string :nome

      t.timestamps
    end
  end
end
