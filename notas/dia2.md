
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


----
Ivan                        Maestro | Centinela 1        172.31.12.111        
Victor                      Esclavo | Centinela 2
Juanjo                      Centinela 3
---
David                                                   172.31.14.177
JuanAntonio
Ruben
---
Concha                                                  172.31.13.236
Vero
Urko
---
Ivan/Profe                                              172.31.9.115
Javier
Jorge
---