Redis H/A
    Maestro
    Esclavo
    3 centinelas
    
    BBDD clave-valor
    
    2 instalaciones:
        Hierro:         Explotación
        Contenedores:   Desarrollo

Ruby: App ejemplo < Passenger

Instalar aquello dentro de un Passenger + Apache

Apache
    Cargamos el módulo de Passenger
    Creamos un VirtualHost

Montar un app ruby desde 0 < resque > REDIS

REDIS: Contenedor.
Crear app... rails
    resque
    Crear un app web...
        Postponer trabajos (resque) > REDIS
    
    Crear un worker ... procesar asincronamente los trabajos aplazados en redis
        Procesos que están corriendo a nivel de SO.
    Dashboard de resque
    
Pasarlo a nuestro entorno de prod
    RESQUE-> REDIS PROD (replicacion+centinelas)


---
# App Ruby
Necesitamos gemas... librerias
Podemos tener muchas apps de ruby en la maquina....
Y esas apps pueden tener dependencias diferentes.
App1
    Gem1 v1
    Gem2
App2 
    Gem1 v2
    Gem3
    

http://miapp/comer/manzana
http://miapp/comer/pera
App < Recibe peticiones: PETICION1, PETICION2
    Las peticiones no las ejecuta... sino las encola... para su ejecución posterior
    
Workers (trabajadores): JOB
    Mirando si en la cola de redis hay peticiones...
    Cada peticion que haya, ejecutarla!
    
REDIS:
    COLA: PETICION2, PETICION1
    
    
--- Montar nuestra App
1- Instalar la version de ruby que me interese
2- Instalar Rails
3- Pedir a rails que queremos una nueva app
4- En esa app decir que vamos a usar resque (gema)
5- Instamos la gema
6- Configurado Resque: Vas a trabajar con TAL servidor de redis
7- Hemos montado un programa (controlador: Comer) que al recibir una peticion (comida) 
    la mete en una cola de redis(frigorifico)
8- Hemos montado una ruta en rails:
    Cuando se llame a un contexto de nuestra app: http://miapp/comer/comida
    Se le pase esa información al programa que hemos hecho en el punto 7, para que la guarde en la nevera
9- Hemos creado un Job: Comer
    Este trabajo será realizado por unos workers
10- Configurar y arrancar los workers (los que comen lo que hay en la nevera)

11- Darle la comida. Arrancar la parte de la app que mete la comida en la nevera
    Esto es una app web:
    Necesito un servidor WEB.
        Rails tiene el suyo... me vale para desarrollo. NO PARA PROD
        $ rails s
http://servidor:Puerto/comer/COMIDA

curl http://localhost:8080/comer/platano
curl http://localhost:8080/beber/riojita

----------------------------------------
Queue: Cola

Estructura de almacenamiento de datos:
    Cola - Queue
        Sigue un modelo FIFO
        First In > First Out
            El primero que pongo, es el primero que sale
            El primer trabajo que encolo, es el primero que se ejecuta
            Me garantiza el orden de ejecución de las tareas apuntadas en redis.
            
    Pila - Stack
        Sigue un modelo LIFO
            Last In > First Out
    Arbol - Tree
    HashMap
    Array
    
----------------------------------------    

Cola: 
    Emails- Pendientes
    Emails-Procesandose por el worker 1
    Emails-Procesandose por el worker 2
        Hay que mandar un email a Lucas... para que deje los martinis y come más pimientos!

Worker 1 Leyendo de la cola Emails
    Voy a mandarle el email a Lucas....
Worker 2 Leyendo de la cola Emails

I. Me interesa sacar de redis (cola) la tarea cuando la toma un worker? 
    Resuelve el problema de que 2 workers no ejeuten la misma tarea? SI
    Pero... tengo otro? Que pasa si el worker se cae a medias.... RUINA !!!!!!!
        El pobre lucas sigue bebiendo como un cosaco.!!!!
II: la muevo a otroa cola, asociada al worker 1... en proceso (started)
    Resuelve el problema de que el 2 no la pille? SI
        El 2 solo mira la cola grande... Pendientes!
    Resuleve el problema que tengo si se cae Worker1?
        En parte... El worker2 no es capaz de leer la cola del worker1
        Pero al menos el dato no lo he perdido
    Ahi entra la magia de resque!!!! Resque vien al resquiate!!!
        Si heartbeat (worker1).... RIP !!!!!!
        Le paso lo que tenia comenzado y lo pongo de nuevo en pendiente
-----

# ENTORNO DE PRODUCCION
                                HOST 0
            ------------------ Apache Frontal ---------------------------
            |                                   |                       |
            Host A                              Host B                  Host C
            |- Apache Backend                   |- Apache Backend       |- Centinela 3
            |   Passenger                       |   Passenger
            |       App1                        |       App1
            |       App2                        |       App2
            |- Redis maestro*-------------------|- Redis esclavo (pasivo-replicación)
            |- Centinela 1                      |- Centinela 2
            |- Workers... 13                    |- Workers....13
            |    Son procesos                   |    Son procesos 
            |    independientes a nivel de SO   |    independientes a nivel de SO
            |       5 batch                     |       5 batch
            |       8 colas                     |       8 colas
            |            COMER                  |            COMER

Llegan las peticiones al host B? 
    Donde se guardan?  En la cola PERTINENTE de REDIS
    Donde está REDIS?  En ambos... En 2... Quién manda? HOST A
    Quien las procesa? NPI
        26 procesos paralelos (2x13) en 2 hosts... todos tirando al mismo maestro
            
Se cae el Host B. Qué pasa?
    El Redis del HOST A se queda de maestro
    - Quién procesa.... solo tengo los ejecutores (workers) A
    - Qué pasa con lo que estaban haciendo los del B?
        - Se pasan a la cola de pendientes... quién gestiona esa cola? Redis HOST A
    - Todo guay 1
    
    
    
## Quién monitoriza esos procesos? 
systemctl

# Dashboard de resque

echo http://$(curl ifconfig.me):8080/jobs


curl http://localhost:8080/comer/pimiento
curl http://localhost:8080/comer/pepino
curl http://localhost:8080/comer/tomate
curl http://localhost:8080/comer/salmon
curl http://localhost:8080/comer/zanahoria
curl http://localhost:8080/beber/rioja
curl http://localhost:8080/beber/martini
curl http://localhost:8080/beber/ronmiel
curl http://localhost:8080/beber/whisky
curl http://localhost:8080/comer/pimiento
curl http://localhost:8080/comer/pepino
curl http://localhost:8080/comer/tomate
curl http://localhost:8080/comer/salmon
curl http://localhost:8080/comer/zanahoria
curl http://localhost:8080/beber/rioja
curl http://localhost:8080/beber/martini
curl http://localhost:8080/beber/ronmiel
curl http://localhost:8080/beber/whisky





3 maquinas:
    Apache - configurado passenger app demo
           - configurar app nueva.  
    Centinela redis
    
Redis maestro
Redis Esclavo
