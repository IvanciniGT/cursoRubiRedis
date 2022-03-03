class Comer
  @queue = :frigorifico

  def self.perform(comida)
      # Aqui pondriamos código de programación.... concreto relativo a la tarea que quisieramos hacer.
      # Mandar un email
      # Hacer una petición por REST a un servicio
      # Dar de alta en una BBDD
    # Mostrar algo en la terminal (salida estandar)
    puts "Me comí #{comida}."
  end
end
