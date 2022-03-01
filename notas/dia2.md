
Redis:
    Maquina1
        Nodo1-Redis Maestro  POF !!!!
            En cuanto recibe algo, da el OK, da confirmación a un cliente
                Dato 1
                Dato 2
                Dato 3 Este lo pierdo... pero que lo pierdo lo pierdo!
                
    Maquina2
        Nodo1-Redis Esclavo1
            Dato1
            Dato2           # Si el redis3 es elegido maestro, este datos se pierde
    Maquina3
        Nodo1-Redis Esclavo2
            Dato1
