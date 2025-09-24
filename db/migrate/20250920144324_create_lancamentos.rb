class CreateLancamentos < ActiveRecord::Migration[8.0]
  def change
      create_table :lancamentos do |t|
        t.references :setor, null: false, foreign_key: true
        t.references :user, null: false, foreign_key: true
        t.references :categoria, null: false, foreign_key: true
        t.date :data
        t.decimal :valor

        t.timestamps
      end
    end
  end
end
