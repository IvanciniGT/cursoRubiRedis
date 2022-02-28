Instalación con 5 contenedores:
    2 redis
        Maestro
        Esclavo
    3 contenedores con sentinel

# Contenedor?

Una forma de ejecutar procesos dentro de un sistema LINUX

Un entorno aislado donde ejecutar procesos dentro de un SO Linux.
Se hace uso de funcionalidades que existen en el kernel de LINUX.
Entorno aislado:
    - Su propia configuración de RED > Su propia IP
    - Sus propias variables de entorno
    - Limitación de acceso a recursos HW
    - Su propio FileSystem

Los contendores los creamos desde IMAGENES de CONTENEDOR.
Un fichero .tar (comprimido) que lleva dentro? Una app ya instalada por alguien y 
    con una configuración que podré parametrizar.
    Además se suelen incluir utilidades que me vienen bien... por si quiero hacer mis cosillas.
        sh bash ls

REGISTRY (contiene repositorios de imagenes de contenedor)
El más famoso: docker hub... quay.io (redhat)


docker container create --name maestro redis:4.0.10-alpine
docker start maestro

docker run --name maestro redis:4.0.10-alpine

Lo tenemos en el puerto 6379

Docker puede crear vlans y redes logicas 
Al instalar docker, se crear una red lógica en nuestra máquina (similar a la red de loopback) - 127.0.0.1 - localhost

Al trabajr con docker, usamos NAT : redireccion de puertos:
    Oye docker, dile al SO, que cuando le manden algo a un PUERTO XXXX del host lo reenvie al Puerto YYYY del contenedor.