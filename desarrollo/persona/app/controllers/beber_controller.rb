class BeberController < ApplicationController
    
    def bebida
                             # Hace referencia al valor que me dieron en la URL
                                # martini
        Resque.enqueue(Beber, params[:bebida])
                       # Beber: Job (tipo de trabajo que voy a querer hacer con ese martini)
        # Muestra un mensaje en salida estandar
        render :plain => "He guardado en la bodega: #{params[:bebida]}"
    end
    
end
