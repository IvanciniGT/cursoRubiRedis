class ComerController < ApplicationController

    def comida
        Resque.enqueue(Comer, params[:comida])
        # Muestra un mensaje en salida estandar
        render :plain => "He guardado en la nevera: #{params[:comida]}"
    end
end
