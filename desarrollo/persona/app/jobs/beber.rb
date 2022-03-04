class Beber
  # El nombre de la cola que se usa en redis para guardar las peticiones
  # En nuestro caso: bebidas: martini
  @queue = :bodega

  def self.perform(bebida)
      # Aqui pondriamos código de programación.... concreto relativo a la tarea que quisieramos hacer.
      # Mandar un email
      # Hacer una petición por REST a un servicio
      # Dar de alta en una BBDD
    # Mostrar algo en la terminal (salida estandar)
    sleep 5
    puts "Me bebí: #{bebida}."
  end
end
