class CreateTareas < ActiveRecord::Migration[5.2]
  def change
    create_table :tareas do |t|
      t.string :name
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
