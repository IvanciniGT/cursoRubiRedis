
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
Ivan/Profe                                              172.31.9.115 √ Beber martini!!!!
Javier                                                               √
Jorge
---


Cuando arrancamos un redis distribuido nos está dando un problema y es que no deja a nadie conectarse con el maestro
ni con un esclavo.... dice que está en modo protegido.

Soluciones:
- desactivar el modo protegido.
    protected-mode no
                                    COMO LO VEIS?  Desarrollo guay! ... Para prod? Lo dejo al aire
- bind 127.0.0.1 172.31.9.115
    Aquí ya no entra el modo protegido
                                    COMO LO VEIS?  Estoy igual!!!
√ Poner contraseña para poder acceder 
    -   En maestro: Establezco contraseña
            Maestro, Esclavo: requirepass CONTRASEÑA_DE_MAXIMA_SEGURIDAD
    -   En esclavo: Establezco contraseña y configuro contraseña del maestro
            Esclavo:          masterauth  CONTRASEÑA_DE_MAXIMA_SEGURIDAD_DEL_MAESTRO
    -   Sentinel: Configuro contraseñas de los redis de datos
            Sentinel:         sentinel auth-password GRUPO_REDIS  CONTRASEÑA_DE_MAXIMA_SEGURIDAD_DEL_MAESTRO
    -   Clientes: Uso las contraseñas para conectarse
    -   