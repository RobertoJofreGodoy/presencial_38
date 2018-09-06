class CompletadosController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @tarea = Tarea.find(params[:tarea_id])
    @completado = Completado.new(tarea: @tarea, usuario: current_usuario)
      if @completado.save
        redirect_to tareas_path, notice: 'La tarea ha sido completada'
      else
        redirect_to tareas_path alert: 'La tarea no ha podido ser completada'
      end
    end
end
