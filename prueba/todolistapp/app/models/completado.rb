class Completado < ApplicationRecord
  belongs_to :usuario
  belongs_to :tarea
end
