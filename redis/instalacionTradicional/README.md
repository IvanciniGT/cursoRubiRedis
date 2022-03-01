
1º Instalar REDIS. Problema... versión.
- compilación/ensmblado del binario desde el codigo fuente de redis
- Descargar el codigo fuente de redis
    La version adecuada del:
        https://download.redis.io/releases/
    En nuestro caso: 4.0.10: https://download.redis.io/releases/redis-4.0.10.tar.gz
    $ wget -c https://download.redis.io/releases/redis-4.0.10.tar.gz
    $ tar -xvf redis-4.0.10.tar.gz # Descomprimir el codigo fuente
- Instalar los programas de compilacion/linkado
    $ sudo apt-get install build-essential tcl wget
- Compilar/Linkar redis
    $ cd redis-4.0.10/
    $ make
    $ sudo make install
    $ cd utils
- Instalamos
    $ sudo ./install_server.sh
        
        -- Maestro | Esclavo
        Port           : 6379
        Config file    : /etc/redis/maestro.conf
        Log file       : /var/log/redis_maestro.log
        Data dir       : /var/lib/redis/maestro
        Executable     : /usr/local/bin/redis-server
        Cli Executable : /usr/local/bin/redis-cli
        -- Centinela
        Data dir       : /tmp/redis/maestro

    En este punto ya tenemos un servicio gestionable a través de systemd.
    Realmente el fichero de servicio es un fichero de SysV (init script tradicional)
    El servicio se llama como el puerto???¿?¿
    $ systemctl status redis_6379.service
    
    RARO.. Le cambiamos el nombre
    $ sudo cp /etc/init.d/redis_6379 /etc/init.d/redis_maestro
    $ sudo systemctl daemon-reload
    
    La ruta del fichero de configuración la vemos al hacer un cat
    del fichero del servicio. El fichero del servicio me sale al hacer
    el systemctl status redis_XXXXXX
    
2º Configurar redis
    Tenesitamos editar el fichero de configuración:
    $ sudo vim /etc/redis/maestro.conf
    
    
    $ En nuestro caso para poder editarlo más cómodamente
    $ cp /etc/redis/maestro.conf ~/environment/curso/redis/instalacionTradicional/
        
        PROPIEDAD           VALOR
        # Para todos:
        appendonly          yes
                            Tras un reinicio, mantener los datos que hubiera
        bind                O la quito y que esuche en todas las interfaces
                            O le pongo la IP de mi red donde están conectados el resto de redis y apaches
        
        # Los centinelas no les pondría límite de memoria ni algoritmo de evacuación
        # Casi no usan memoria
        
        maxmemory           Le asigno una memoria máxima...
                                - La saco primero de una estimación
                                - La ajusto con monitorización
        maxmemory-policy    noeviction
                            U otro... este normalmente nos evita perder datos
                            Al llegar al límite, REDIS no admite más escrituras.
                        
        # Para los esclavos                
        slaveof IP_MAESTRO 6379
        # En versiones nuevas de redis... se ha cambiado por 
        replicaOf
    
    $ sudo cp ~/environment/curso/redis/instalacionTradicional/maestro.conf /etc/redis/maestro.conf                                                                          

3º Arrancamos redis:
    $ sudo systemctl start redis_maestro.service
    $ sudo systemctl enable redis_maestro.service
4º Comprobación:
    $ sudo systemctl status redis_maestro.service
        POCO CONVINCENTE.... 
    Mirar el puerto
    $ netstat -lnt 
    $ ps -eaf | grep redis-server
    
    $ redis-cli
        info
            A revisar:
                1º fichero cofiguración
                2º versión redis
                3º Memoria
                41    # Replication
                        role:master
                        connected_slaves:0
        exit