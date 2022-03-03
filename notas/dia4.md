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

http://servidor:Puerto/comer/COMIDA
curl http://localhost:8080/comer/platano