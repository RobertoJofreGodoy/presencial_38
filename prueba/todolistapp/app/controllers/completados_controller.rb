class CompletadosController < ApplicationController
  before_action :authenticate_usuario!

  def create
    @tarea = Tarea.find(params[:tarea_id])
    @usuario = current_usuario
    @existe =  Completado.where(tarea: @tarea, usuario: current_usuario)
    if @existe.empty?
      @creado = Completado.new(tarea: @tarea, usuario: current_usuario, listo: true)
      if @creado.save
          redirect_to tareas_path, notice: 'La tarea ha sido completada'
        else
          redirect_to tareas_path, alert: 'La tarea no ha podido ser completada'
      end
    else
  		if Completado.where(tarea: @tarea, usuario: current_usuario).update_all(listo: true)
  			redirect_to root_path, notice:'La tarea ha sido completada'
  		  else
  			redirect_to root_path, alert:"La tarea no ha podido ser completada"	
  		end
	  end	
  end

  def update
  	@tarea = Tarea.find(params[:tarea_id])
  	@usuario = current_usuario
  	if Completado.where(tarea: @tarea, usuario: current_usuario).update_all(listo: false)
  		redirect_to root_path, notice:'La tarea ha sido desmarcada'
  	else
  		redirect_to root_path, alert:"La tarea NO ha sido desmarcada"	
  	end
  end

  def completado_params
  	params.require(:completado).permit(:usuario_id, :tarea_id, :listo)
  end
end

