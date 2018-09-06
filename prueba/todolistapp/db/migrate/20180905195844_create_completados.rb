class CreateCompletados < ActiveRecord::Migration[5.2]
  def change
    create_table :completados do |t|
      t.references :usuario, foreign_key: true
      t.references :tarea, foreign_key: true
      t.boolean :listo, :default => false
  

      t.timestamps
    end
  end
end
