class TareasController < ApplicationController
  def index
    @tareas = Tarea.all
  end
end
