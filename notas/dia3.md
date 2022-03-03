Systemd toma control del proceso que arranca el execstart

Systemd -> ejecutable -> PID
            Arrancan en primer plano
            
Systemd -> ejecutable -> PID (script)
                                    lanzar un comando en segundo plano -> PID2
        En este cado debe monitorizar el proceso PID2                                    

Redis maestro
    + centinela
Redis esclavo (replicación)
    + centinela

Centinela (Quorum)

----------------------------

Ruby 
    Aplicaciones web      url -> http -> html
    rails: Framework permite montar aplicaciones web de una forma sencilla

Apache
    DocumentRoot : Ficheros HTML, js, imagenes en el disco duro

El desarrollo consisten en montar Programa que genera HTML

El programa no sabe de muchas otras cosas... por ejemplo:
    Atender peticiones http

Servidor web.... avanzado, que sepa de hablar con un programa para pedirle que genere HTML

Passenger: Servidor de aplicaciones web, especializado (entre otros) en hablar con programas ruby (rails)
            JBoss
            Weblogic
            Websphere
            rtomcat
            IIS
            Django

Apache 2.4
Passenger
Ruby
Configurar que apache hable con Passenger
Passenger  hable con la app ruby que han desarrollado Vero y Urko

Cuando desarrollo una app en ruby... igual que en cualquier otro lenguaje, 
    usamos librerias desarrolladas por otras personas:
        rails: Framework= librerias + metodologia 
        conexión a BBDD
    
    Esas librerias desarrolladas en ruby, las entregamos como gemas! gem
    
-----


Virtualhost <   App  css, js
                     Ruby
    ^                V
Apache      <    Passenger

--------

1- Instalamos Apache                √
2- Instalamos ruby
    rvm list known      Disponibles
    rvm list            Los instalados
    rvm install XXXX.   Instalar uno nuevo
    rvm use XXXX.       Usar un determinado ruby
    
    which ruby          El path del ruby que estoy usando
3- Instalamos el modulo de apache de passenger
    $ sudo apt install libapache2-mod-passenger -y
4- Activar el modulo en apache
    $ sudo a2enmod passenger
5- Validar la instalación de passenger en Apache
    $ sudo /usr/bin/passenger-config validate-install
    Nos ha dado error... faltan paquetes adicionales:
    $   sudo apt-get install apache2-threaded-dev   # Este es el que me informaba.. No se encuentra
    $   sudo apt-get install apache2-dev            # Este es el reemplazo en nuestro caso. Comprar bien cual hay que montar,
    
    Comprobar el estado de passenger
    $ sudo passenger-status
    $ sudo passenger-memory-stats

6- Montamos una app
    Esta es una app de ejemplo:
    $ git clone https://github.com/phusion/passenger-ruby-rails-demo.git
    
    La instalo:
    $ bundle install
        Descargado las gemas
    
7- Montar el virtualHost en Apache
    Importante: Configurar la propiedad:
        PassengerRuby:  El ruby que estamos usando para empaquetar/instalar nuestra app
        DocumentRoot:   Debe apuntar a la carpeta public de mi app
            En automatico Passenger entiende que la app RUBY está en el directorio padre del DocumentRoot
            

    
    $ sudo cp app.conf /etc/apache2/sites-available    
    
    Activar el virtualhost
    $ sudo ln -s /etc/apache2/sites-available/app.conf /etc/apache2/sites-enabled/app.conf
    
    Reinicio del apache
    $ sudo systemctl restart apache2
    
    
    
    
    
Apache :
    VirtualHost
    
Levantamos un proceso de apache en el host (Servicio)
    Abre puerto(s) en una o varias IPS 192.168.100.100
    Y escucha peticiones por http(s)
    
Dentro de un host donde tengamos apache, quizás tenemos multiples apps web o sitios web.
    VirtualHost
        Puerto          80                                          CONTEXTO
        Nombre fqdn     app1.prod       <       http://app1.prod    /
                                                                                http://app1.prod/index.html
                                                                                http://app1.prod/images/icon.png
        DocumentRoot    Carpeta local de mi servidor                /var/app1/
                                                                                /var/app1/index.html
                                                                                /var/app1/images/icon.png
DNS
    app1.prod:      192.168.100.100
    app2.prod:      192.168.100.100

----
    
    VirtualHost
        Puerto          80                                            CONTEXTO
        Nombre fqdn     servidor.prod       <       http://app1.prod  /app1
                                                                                http://servidor.prod/app1/index.html
        DocumentRoot    Carpeta local de mi servidor                /var/app1/
                                                                                /car/app1/index.html
    VirtualHost
        Puerto          80                                            CONTEXTO
        Nombre fqdn     servidor.prod       <       http://app1.prod  /app2
                                                                                http://servidor.prod/app2/index.html
        DocumentRoot    Carpeta local de mi servidor                /var/app2/
                                                                                /car/app2/index.html
DNS
    servidor.prod:      192.168.100.100




------------------------------------------------------------------------------------------
                                                             /- app1 - Ruby
                                                            /-- app1 - Ruby
                                     /   Apache - Passenger - app2 - Ruby
                                    /               Si guardo datos en Memoria RAM? Necesito sticky sessions
Cliente  <>   Apache Frontal (BC)  <                Si NO-> REDIS.... ya no hay problema
                                    \
                                     \   Apache - Passenger - Ruby
               * Sticky session *                           \ Ruby


PassengerStickySessions         on
PassengerMinInstances           Número mínimo de procesos que puedo tener para una aplicación
PassengerMaxPoolSize            Número maximo de procesos que puedo tener en Passenger                  32
    Los pondríais iguales entre si! ^V
PassengerMaxInstances           Número máximo de procesos que puedo tener para una aplicación            5
PassengerPoolIdleTime

Cliente  > MANDA                    SERVIDOR APACHE.                        PASSENGER.                  APP
                                    Timeout                                 Timeout de encolamiento     Tarda X tiempo
                                    - Cortar las conexiones lentas (DoS)                                    Si hay muchas en paralelo se están encolando
                                    - Passanger (backend) ?????                                                 3 > 2 > 1 
                                    - De cola                                                               Faltan procesos paralelos :
                                                                                                                - Fallo en configuración
                                                                                                                    - Si la CPU no está calentita... 
                                                                                                                        es que no se abren sufientes 
                                                                                                                            procesos en paralelo -> RAM???
                                                                                                                    
                                                                                                                - Falta CPU. Es lo que hay!!
                                                                                                                        - Me quedo como estoy y más lento las peticiones
                                                                                                                        - Más CPU
timeout respuesta
    
    En envío es lento ->
    Empieza a contar el Tout del cliente


Cada proceso (Proceso a nivel de Sistema Operativo) va a abrir hilos!           

------
# GLOBAL DE PASSENGER/APACHE
PassengerMaxPoolSize            10     # Esto lo que aguanta la maquina !

# A NIVEL DE VIRTUALHOST A
PassengerMaxInstances           7
Min                             3

# A NIVEL DE VIRTUALHOST B
PassengerMaxInstances           7
Min                             3


