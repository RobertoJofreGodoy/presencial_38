class TareasController < ApplicationController
  def index
   @listo = []
   @tarea = Tarea.all
   if usuario_signed_in?
    @completado = Completado.select(:usuario_id, :tarea_id).where(:usuario_id => current_usuario, :listo => true).all
    @completado.each do |lista|
    @listo << lista.tarea_id 
     end
    @completos = @listo.length
    @total = Tarea.all.count
   end
 end

 def show
   @usuarios = []
   @tarea= Tarea.find(params[:id])
   if usuario_signed_in?  
    @usuarios = Usuario.joins(:completados).where(completados: {tarea_id: @tarea, listo: true})
    @completado = Completado.select(:usuario_id, :tarea_id).where(:usuario_id => current_usuario, :listo => true).all
    @completado.each do |lista|
    @listo << lista.tarea_id 
     end
    @completos = @listo.length
    @total = Tarea.all.count
    @ranking = Usuario.joins(:completados).where(completados: {tarea_id: @tarea, listo: true}).order('updated_at').limit(5)
   end
 end

 def tareas_params
     params.require(:tarea).permit(:name, :description, :photo)
 end
end
