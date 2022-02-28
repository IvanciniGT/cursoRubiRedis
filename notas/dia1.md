# Objetivo

Instalación H/A App:
    - Rubi
    - Apache / passenger
    - Redis

# Redis

* H/A:              Intentar garantizar un determinado tiempo de servicio de un app... jugar a la loteria...
                    99%             |   €               3,6 dias año el servicio padado.
                    99,9%           |   €€              8 horas al año.
                    99,99%          V   €€€             minutos al año... Replicación en zonas geográficas distintas 
                                                                          y con distinto proveedores de red 
- Escalabilidad:    Capacidad de ajustar la infra a las necesidades de app dinámicamente

Estas características se consiguen mediante el trabajo con "clusters"

## Cluster?
Varios procesos (normalmente en varias máquinas) que trabajan conjuntamente para dar un servicio.

Cluster apaches
    Maquina 1   
        httpd 2.4 - appX    |
    Maquina 2                >      Balanceador de carga        <        Clientes?
        httpd 2.4 - appX    |           Apache (proxy reverso, con lb)
        
Maquina 1 CPU 60%
Maquina 2 CPU 60%
    Escalabilidad?      GUAY
    H/A?                Si se cae 1... el que queda no es capaz dde asumir la carga
        Memoria y cpu < 35%
        (apache/redis)
        SO 30% Apache: 30% Apache 30%

Redis:
- Sesiones
- Gestion de colas de trabajos asincronos

Cookie sesion:
 198373761
Clientes -> http(s) -> App Web X
                    Sesión (Espacio en RAM donde depositar datos que no son persistentes, 
                            pero que son necesarios mientras el usuario está conectado).
                                198373761 -> Usuario validado con unos roles

Apache 1    POF !!!
    RAM - Sesion usuario X            < Usuario 1 NO PUFF !
Apache 2
    RAM - Sesion usuario X            < Usuario 1

Balanceador de carga (Apache) sticky sessions:
    Si un usuario X se ha mandado previamente a la maquina 1... a partir de ese momento se mande a la máquina 1 siempre
    
## Redis 

BBDD de tipo clave/valor

Al igual que : Cualquier BBDD, ElasticSearch, Kafka, su configuración en cluster es muy especial... porque son stateful
Cada instancia de esas apps en un cluster, es diferente a las demás.

REDIS:
    - HA
    - Escalabilidad

Maquina 1
    REDIS1
        Guardado un conjunto de claves-valor
    Todo funciona guay... hasta que se cae maquina 1.... problemon!             HA
    Todo funciona guay... hasta que la máquina no da más de si... problemon!!   Escalabilidad

El segundo caso "ESCALABILIDAD" lo resolveríamos a través de un cluster activo/activo.
    En este escenario montaríamos varios procesos REDIS y cada uno guarda una parte de los datos.

Los datos se guardan asociados a un ID
Cluster de REDIS
    Maquina 1 - Redis 1 - Guardase los datos cuyos IDs -> HASH -> RESTO AL DIVIDIR ENTRE 3
    Maquina 2 - Redis 2
    Maquina 3 - Redis 3

Cada una de esas máquinas seria un "MAESTRO".

DNI (clave) 23000000 -> Letra (HASH: 23000000/23 división entera)
                                    Resultado:    1000000
                                    Resto:              0
DNI (clave) 23000022 -> Letra (HASH: 23000001/23 división entera)
                                    Resultado:    1000001
                                    Resto:             22
    Los restos de la división entera están entre: 0-22:
        0-7   -> Redis1
        8-15  -> Redis2
        16-22 -> Redis3

¿Qué consigo con esto? Escalabilidad. 
    Tengo 3 maquinas (3x recursos: ram, cpu) para procesar/almacenar/buscar) información   

Esta configuración es: CLUSTER ACTIVO/ACTIVO


Esto NO RESULEVE VUESTRO PROBLEMA. NO NOS VALE.
Cluster de REDIS:
    Maquina 1 - Redis 1       - Guardase datos
    Maquina 2 - Redis 1_Copia - Guardase datos mismos que están en REDIS1

Qué consigo?
    Escalabilidad? 
        Un poquito...
            Al escribir ... no ... estoy fastiado... sigo teniendo solo 1 sitio donde escribir ( no 2 en paralelo)
                REDIS1 es el receptor de los datos.
            Al leer... Tengo 2 sitios de donde leer... algo consigo en cuanto a escalabilidad.
    HA?
        Si se cae uno... tengo el otro. GUAY !!!! ESTO SI RESUELVE VUESTRO PROBLEMA
    
    En este caso: Tenemos un nodo:         MAESTRO
                          un segundo nodo: ESCLAVO
    
Esta configuración es: CLUSTER ACTIVO/PASIVO

Aquí podemos hacer configuraciones híbridas.

MAESTRO 1 - ESCLAVO 1
MAESTRO 2 - ESCLAVO 2
MAESTRO 3 - ESCLAVO 3

Qué tengo aquí? Qué consigo?
    √ Escalabilidad
    √ HA


## Configuración de HA

REDIS 1 -   esclavo
REDIS 2 -   maestro

Quíen decide quién es maestro y quién es esclavo?
    Podré hacer una configuración INICIAL en REDIS... que diga el 1 es esclavo y el 2 maestro

Quien decide quién es maestro y quién es esclavo? Las instancias.... llegan a un acuerto: Quorum FALSO
                                                    Sentinel es quién decide
            
    
            Clientes
            |
            https (certificado)
            |
          Frontal  443
          Apache
            |
  -----------------------
  | IP: 172.10.0.1      | IP: 172.10.0.2
HOST                   HOST
  |- 80    Apache        |- 80      Apache
  |         Rubi: stnl1  |           Rubi: stnl1
  |         Rubi: stnl2  |           Rubi: stnl2
  |- 6379  Redis 1       |- 6379    Redis 2 
  |- 16379     (int)     |- 16379       (int)
  |- 26379 Sentinel      |- 26379   Sentinel

En qué puerto funciona un REDIS?     6379 por defecto
Redis tiene un segundo puerto?     +10000 por defecto > 16379

Cuando hacemos una escritura en REDIS ... donde se guarda el dato cuando se da el OK al cliente?
    En el maestro . Cuando el dato está guardado en el maestro, se da OK al cliente
    Cliente? App X que tengo en rubi dentro del apache

En ruby, en la configuración, poneis la IP del servidor de REDIS > CONEXION

Qué IP pongo ahora?             La del maestro
Y si tuviera varios maestros?   La de un balanceador de carga que tuviera por delante de los REDIS (HAProxy)
                                Pero me serviría realemente la IP de cualquier maestro (cuidado, que le frio a peticiones)

Configuración de redis:
    Redis1: Maestro
    Redis2: Esclavo

Qué pasa si se cae el redis1? estoy jodido !!!!!


Sentinel de REDIS: Es un programa de REDIS, independiente al servidor de datos de redis.
                   Su misión: Identificar y nombrar quién es el maestro.

Qué IP pongo ahora en rubi? La del sentinel... pero eso no es directo.
El sentinel lo unico que me informa a mi como cliente, es quiñen es el maestro.
    A mi me toca luego conectar directamente con el maestro, cuando quiera meter un dato.

## Necesitamos un cliente de REDIS que soporte el trabajo con Sentinel. Casi todos... En concreto el de rubi lo soporta.

Y al cliente a la hora de conectarse con REDIS, ya no le pongo la IP del maestro de redis... sino la del sentinel.
Internamente, la libreria que uso de redis, pregunta al sentinel, ¿quién es el maestro?
Una vez sepa quién es el maestro ACTUAL, le ataca. De ahí saca la IP.

## Qué pasa aquí... respecto a HA

Si se cae el sentinel? me quedo sin posibilidad de conectar con REDIS
Necesito por tanto varios SENTINEL: Al menos 2???? Seguro???? Vamos a verlos

¿Qué IP pongo en rubi? La de los sentinel

# CASOS PROBLEMATICOS HA
    
            Clientes
            |
            https (certificado)
            |
            HOST
            |-  Apache  Frontal  443
  -------------------------------------------------------------------
  | IP: 172.10.0.1      | IP: 172.10.0.2                            | IP: 172.10.0.3
HOST                   HOST                                       HOST
  |- 80    Apache        |- 80      Apache                          |- 26379 Sentinel 3
  |         Rubi: stnl1  |           Rubi: stnl1                    
  |         Rubi: stnl2  |           Rubi: stnl2                    
  |- 6379  Redis 1*      |- 6379    Redis 2
  |- 16379     (int)     |- 16379       (int)                       
  |- 26379 Sentinel 1    |- 26379   Sentinel 2                      

Qué ocurre?
ESCENARIO1: Se cae el REDIS 2
Los sentinel detectan la caida del Redis2... decisión: Todo sigue igual: el redis 1 sigue de maestro
    Los rubi al preguntar a los sentinel (a cualquiera de ellos) informarán que el maestro sigue siendo redis 1
    Todo funciona igual que antes.
    Curro mio el reiniciar redis2.... que estoy jugando con fuego > contenedor.    TODOs!!!!

ESCENARIO2: Se cae el REDIS 1
Los sentinel detectan la caida del Redis1... decisión: Cambiamos el maestro: el redis 2 es el nuevo maestro
    Los rubi al preguntar a los sentinel (a cualquiera de ellos) informarán que el maestro es ahora redis 2
    Todo funciona igual que antes.
    Curro mio el reiniciar redis1.... que estoy jugando con fuego > contenedor.    TODOs!!!!

ESCENARIO3: Se cae el Sentinel 1
Los clientes intentan contectar con el 1... no contesta.. pues pasan a preguntar al 2, 
    éste les informa que el maestro sigue siendo el 1: Todo OK
Curro mio, el volver a levantar el sentinel... > contenedor.    TODOs!!!!

ESCENARIO4: Se cae el Sentinel 2
No se entera nadie.... porque los clientes preguntan al sentinel1 y como contesta... pues al 2 no le pregunta nadie.
Sentinel 1 sigue indicando que el maestro es el 1... TODO GUAY !!!!
Curro mio, el volver a levantar el sentinel... > contenedor.    TODOs!!!!

ESCENARIO 5: Se cae una máquina 1
Apache (frontal) solo va a hacer peticiones a la maquina 2
Ahi el cliente de redis (rubi) pregunta al sentinel 1... no contesta... Pasa a preguntar al sentinel 2
Sentinel 2, ya habrá notado la caida de la maquina 1 (redis 1)... Le dice al redis 2 que ahora es maestro
Y comunica esa decisión al rubi (de la maquina 2)
TODO FUNCIONA GUAY
Problema mio, levantar maquina 1.

ESCENARIO 6: Se piedre comunicación en las máquinas
Brain splitting >>> PELIGROSISISISMO !!!!! Ocurre en todo este tipo de APLICACIONES (Redis, Kafka, Elastisearch, mariadb...)
Qué pasa aquí?

rubi maquina 1:
    pregunta al sentinel 1, que le informa que el  maestro sigue siendo redis 1.
    TODO FUNCIONA GUAY !!!

rubi maquina 2:
    pregunta al sentinel 1... no hay conexión
    pregunta al sentinel 2, que le informa que el maestro ahora es redis 2.
    TODO FUNCIONA GUAY !!!! 

O no?
    PROBLEMON !!!!!!!! GIGANTE!!!!
    Tengo 2 maestros... qué pasa cuando se junten de nuevo?
        Los datos del maestro 2 (redis 2) SE BORRAN, los pierdo

REDIS NO PERMITE TENER SOLO 2 sentinel
Necesito siempre un número IMPAR... para conseguir QUORUM
La determinación del nuevo mestro se hace por QUORUM entre MAYORIA de votos de los SENTINEL.
Necesitamos al menos 3 sentinel.