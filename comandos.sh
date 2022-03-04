    1  whoami
    2  pwd
    3  ls
    4  ls
    5  clear
    6  mkdir curso
    7  mkdir curso/rubi
    8  mkdir curso/apache
    9  mkdir curso/redis
   10  mkdir curso/notas
   11  cd curso
   12  git init 
   13  git add .
   14  git commit -m 'alta del curso'
   15  git branch -M main
   16  git remote add origin https://github.com/IvanciniGT/cursoRubiRedis.git
   17  git push -u origin main
   18  git config --global credential.helper store
   19  git push -u origin main
   20  cd.
   21  cd ..
   22  cd pro
   23  git clone https://github.com/IvanciniGT/cursoRubiRedis.git profesor
   24  cd profesor/
   25  git pull
   26  git commit -am 'alta2'
   27  git pullgit status
   28  git status
   29  git status
   30  cd ..
   31  cd curso
   32  git commit -am 'alta2'
   33  git push
   34  git pull
   35  free
   36  clear
   37  docker container create --name maestro redis:4.0.10-alpine
   38  docker start maestro
   39  ps -eaf | grep redis
   40  docker stop maestro
   41  ps -eaf | grep redis
   42  ps -eaf | grep redis
   43  docker start maestro
   44  ps -eaf | grep redis
   45  docker inspect maestro | grep IPA
   46  docker inspect maestro
   47  docker inspect maestro | grep IPA
   48  telet 172.17.0.2 6379
   49  sudo apt install telnet -y
   50  ps -eaf | grep telnet
   51  kill -9 24245
   52  telnet 172.17.0.2 6379
   53  ip a
   54  netstat -lnt 
   55  docker rm maestro -f 
   56  docker container create --name maestro -p 0.0.0.0:6379:6379 redis:4.0.10-alpine
   57  docker start maestro
   58  netstat -lnt 
   59  # telnet localhost 3679
   60  # telnet 172.31.9.115 3679
   61  # telnet 172.31.9.115 6379
   62  ps -eaf | grep redis
   63  ps -eaf | grep 25112
   64  docker exec maestro ls /
   65  ls /home
   66  docker exec maestro ls /home
   67  docker exec maestro ls /bin
   68  docker exec maestro sh
   69  sh
   70  exit
   71  bash
   72  docker -it exec maestro sh
   73  ps -eaf | grep redis
   74  ps -eaf | grep 25112
   75  docker exec -it maestro sh
   76  docker ps
   77  docker ps --all
   78  docker logs maestro
   79  ps -eaf | grep redis
   80  clear
   81  sudo apt install docker-compose -y
   82  df -h
   83  docker images
   84  docker images -q
   85  docker rmi $(docker images -q)
   86  df -h
   87  docker-compose --version
   88  history
   89  ps -eaf | grep redis
   90  clear
   91  docker ps
   92  docker rm maestro -f
   93  docker ps --all
   94  cd curso/redis/instalacion\ contenedores/
   95  #docker rm maestro -f
   96  docker-compose up
   97  docker-compose up -d
   98  docker ps
   99  ps -eaf | grep redis
  100  clear
  101  apt-cache madison redis
  102  sudo add-apt-repository ppa:redislabs/redis
  103  apt-cache madison redis
  104  clear
  105  git add :/
  106  cd curso
  107  git add :/
  108  git commit -m 'dia1'
  109  git push
  110  docker exec -it maestro sh
  111  cd curso
  112  git remote get-url origin
  113  git status
  114  cd curso/redis/instalacionContenedores/
  115  git add :/
  116  git commit -m 'centinelas'
  117  git push
  118  git pull
  119  docker-compose up
  120  docker-compose up
  121  ls -l
  122  chmod 666 sentinel.conf 
  123  ls
  124  ls -l
  125  ps -eaf | redis
  126  ps -eaf | grep redis
  127  docker-compose up
  128  ps -eaf | grep redis
  129  docker-compose up
  130  docker-compose down
  131  docker ps --all
  132  docker rm esclavo
  133  docker-compose up
  134  ls -l
  135  docker-compose up
  136  docker-compose down
  137  sudo apt-get install build-essential tcl wget
  138  wget -c https://download.redis.io/releases/redis-4.0.10.tar.gz
  139  cd ..
  140  cd instalacionTradicional/
  141  wget -c https://download.redis.io/releases/redis-4.0.10.tar.gz
  142  tar -xvf redis-4.0.10.tar.gz 
  143  cd redis-4.0.10/
  144  make
  145  sudo make install
  146  ls
  147  cd utils
  148  sudo ./install_server.sh
  149  systemctl status redis_6379.service 
  150  cat /etc/init.d/redis_6379
  151  systemctl status redis_6379.service 
  152  cp /etc/init.d/redis_6379 /etc/init.d/redis_maestro
  153  sudo cp /etc/init.d/redis_6379 /etc/init.d/redis_maestro
  154  systemctl status redis_maestro
  155  systemctl daemon-reload 
  156  sudo systemctl daemon-reload 
  157  systemctl daemon-reload 
  158  systemctl status redis_maestro
  159  sudo vim /etc/redis/maestro.conf
  160  cp /etc/redis/maestro.conf ~/environment/curso/redis/instalacionTradicional/
  161  hostname
  162  sudo cp ~/environment/curso/redis/instalacionTradicional/ /etc/redis/maestro.conf 
  163  sudo cp ~/environment/curso/redis/instalacionTradicional/maestro.conf /etc/redis/maestro.conf 
  164  ufw status
  165  sudo ufw status
  166  sudo systemctl start redis_maestro.service 
  167  sudo systemctl status redis_maestro.service 
  168  git add :/
  169  git commit -m 'instalacion tradicional'
  170  git push
  171  sudo systemctl status redis_maestro.service 
  172  netstat -lnt
  173  ps -eaf | grep redis
  174  redis-cli
  175  sudo systemctl enable redis_maestro.service
  176  sudo systemctl status redis_maestro.service 
  177  clear
  178  cat /etc/init.d/redis_6379
  179  cat /etc/init.d/redis_6379
  180  ps -eaf | grep redis
  181  cat /etc/redis/maestro.conf
  182  cat /etc/redis/maestro.conf | head 10
  183  cat /etc/redis/maestro.conf | head - 10
  184  cat /etc/redis/maestro.conf | head -n 10
  185  cat /etc/redis/maestro.conf | head -n 100
  186  ls -l /etc/redis/maestro.conf
  187  sudo chmod 666 /etc/redis/maestro.conf
  188  sudo systemctl restart redis_maestro.service
  189  sudo systemctl status redis_maestro.service
  190  sudo systemctl status redis_maestro.service
  191  ps -eaf | grep redis
  192  redis-cli
  193  netstat -lnt
  194  ps -eaf | grep redis
  195  redis-cli
  196  netstat -lnt
  197  sudo cp ~/environment/curso/redis/instalacionTradicional/maestro.conf /etc/redis/maestro.conf                                                                          
  198  sudo systemctl restart  redis_maestro.service
  199  sudo systemctl status redis_maestro.service
  200  netstat -lnt 
  201  redis-cli
  202  redis-cli -h 172.31.9.115
  203  clear
  204  sudo systemctl status redis_maestro.service
  205  cat /etc/init.d/redis_maestro
  206  sudo ./install_server.sh
  207  cd ..
  208  cd ..
  209  cp /etc/init.d/redis_26379 .
  210  cp /etc/redis/centinela.conf .
  211  git log --oneline
  212  git diff ../instalacionContenedores/sentinel.conf 52b4d24 HEAD
  213  git diff 52b4d24 HEAD -- ../instalacionContenedores/sentinel.conf
  214  cp /etc/redis/centinela.conf ./centinela.conf.old
  215  sudo cp ./centinela.conf /etc/redis/centinela.conf 
  216  sudo chmod 666 /etc/redis/centinela.conf 
  217  sudo chmod 666 ./centinela.conf
  218  cp ./redis_centinela /etc/init.d/redis_centinela
  219  sudo cp ./redis_centinela /etc/init.d/redis_centinela
  220  sudo systemctl daemon-reload
  221  cp ./redis_centinela /etc/init.d/redis_centinela
  222  sudo cp ./redis_centinela /etc/init.d/redis_centinela
  223  sudo cp ./centinela.conf /etc/redis/centinela.conf 
  224  sudo systemctl daemon-reload
  225  sudo systemctl start redis_centinela.service 
  226  sudo systemctl status redis_centinela.service 
  227  cat /var/log/redis_centinela.log 
  228  ps -eaf
  229  ps -eaf | grep redis
  230  sudo kill -9 28090
  231  ps -eaf | grep redis
  232  clear
  233  ps -eaf | grep redis
  234  clear
  235  sudo kill -9 26892
  236  ps -eaf | grep redis
  237  sudo systemctl start redis_maestro.service 
  238  ps -eaf | grep redis
  239  sudo rm /var/run/redis_6379.pid 
  240  sudo systemctl start redis_maestro.service 
  241  ps -eaf | grep redis
  242  sudo systemctl status redis_maestro.service 
  243  ps -eaf | grep redis
  244  sudo ls /var/run/redis_6379.pid 
  245  sudo rm /var/run/redis_6379.pid 
  246  sudo rm /var/run/redis_26379.pid 
  247  cat /var/log/redis_maestro.log 
  248  clear
  249  sudo systemctl start redis_maestro.service 
  250  sudo systemctl status redis_maestro.service 
  251  sudo systemctl restart redis_maestro.service 
  252  cat /var/log/redis_maestro.log 
  253  ps -eaf | grep redis
  254  sudo kill -9 31381
  255  sudo systemctl status redis_maestro.service 
  256  sudo systemctl stop redis_maestro.service 
  257  sudo rm /var/run/redis_26379.pid 
  258  sudo rm /var/run/redis_6379.pid 
  259  sudo systemctl start redis_maestro.service 
  260  ps -eaf | grep redis
  261  clear
  262  git add :/
  263  git commit -m 'dia2'
  264  git push
  265  systemctl status redis_maestro.service 
  266  cat /etc/init.d/redis_maestro
  267  clear
  268  cd /etc/systemd/syste,
  269  cd /etc/systemd/system
  270  ls
  271  cat sshd.service
  272  clear
  273  cd ~/environment/curso/redis/instalacionTradicional/
  274  sudo cp maestro.conf /etc/redis/maestro.conf
  275  sudo cp redis_maestro_systemd.service /etc/systemd/system
  276  cd /etc/systemd
  277  /system
  278  cd system
  279  ls -l
  280  sudo chmod 755 redis_maestro_systemd.service 
  281  systemctl status redis_maestro
  282  ps -eaf | grep redis
  283  sudo kill -9 885
  284  ps -eaf | grep redis
  285  systemctl stop redis_maestro
  286  sudo systemctl stop redis_maestro
  287  sudo systemctl disable redis_maestro
  288  systemctl status redis_maestro
  289  sudo systemctl status redis_maestro_systemd
  290  sudo systemctl start redis_maestro_systemd
  291  sudo systemctl status redis_maestro_systemd
  292  netstat -lnt
  293  sudo systemctl stop redis_maestro_systemd
  294  sudo systemctl status redis_maestro_systemd
  295  ps -eaf | grep redis
  296  sudo systemctl start redis_maestro_systemd
  297  ps -eaf | grep redis
  298  netstat -lnt
  299  sudo systemctl enable redis_maestro_systemd
  300  clear
  301  ps -eaf | grep redis
  302  sudo kill -9 7404
  303  ps -eaf | grep redis
  304  clear
  305  cd ~/environment/curso/redis/instalacionTradicional/
  306  sudo cp centinela.conf /etc/redis/centinela.conf 
  307  sudo cp redis_centinela_systemd.service /etc/systemd/system
  308  sudo chmod 755 /etc/systemd/system
  309  sudo chmod 755 /etc/systemd/system/redis_centinela_systemd.service 
  310  systemctl status redis_centinela
  311  systemctl disable redis_centinela
  312  sudo systemctl disable redis_centinela
  313  sudo systemctl start redis_centinela_systemd.service 
  314  sudo systemctl status redis_centinela_systemd.service 
  315  ps -eaf | redis
  316  ps -eaf | grep redis
  317  netstat -lnt
  318  sudo systemctl stop redis_centinela_systemd.service 
  319  netstat -lnt
  320  sudo systemctl status redis_centinela_systemd.service 
  321  sudo systemctl enable redis_centinela_systemd.service 
  322  sudo systemctl start redis_centinela_systemd.service 
  323  ps -eaf | grep redis
  324  sudo kill -9 8779
  325  ps -eaf | grep redis
  326  clear
  327  cd /etc/apache2/
  328  apache .v
  329  apache2 -v
  330  systemctl status apache2
  331  curl localhost
  332  curl ifconfig.me
  333  ls
  334  ls -l
  335  ls mods-available
  336  ls sites-available
  337  cat sites-available/default-ssl.conf 
  338  cat sites-available/000-default.conf 
  339  ls sites-enabled/
  340  ls sites-available/
  341  ls -l sites-enabled/
  342  rm sites-enabled/000-default.conf 
  343  sudo rm sites-enabled/000-default.conf 
  344  sudo systemctl restart apache2
  345  ls -l sites-enabled/
  346  ruby -v
  347  rvm
  348  rvm list known
  349  rvm list
  350  which ruby
  351  sudo apt install libapache2-mod-passenger -y
  352  ls mods-available/
  353  cat mods-available/passenger.conf
  354  cat mods-available/passenger.load 
  355  cat mods-enabled/
  356  ls mods-enabled
  357  sudo a2enmod passanger
  358  sudo a2enmod passenger
  359  ls -l mods-enabled
  360  sudo /usr/bin/passenger-config 
  361  sudo /usr/bin/passenger-config validate-install
  362  sudo apt-get install apache2-threaded-dev
  363  sudo apt-get install apache2-dev
  364  sudo /usr/bin/passenger-config validate-install
  365  apt-get install apache2-dev -y
  366  sudo apt-get install apache2-dev -y
  367  sudo /usr/bin/passenger-config validate-install
  368  sudo passenger-status
  369  passenger-memory-stats
  370  clear
  371  sudo passenger-memory-stats
  372  sudo passenger-status
  373  cd ~~
  374  cd
  375  cd environment/curso/
  376  cd rubi/
  377  git clone https://github.com/phusion/passenger-ruby-rails-demo.git app
  378  cd app
  379  bundle install
  380  ls -la ~
  381  pwd
  382  sudo passenger-ruby 
  383  sudo passenger-config
  384  sudo passenger-config about
  385  sudo passenger-config about ruby-command
  386  which ruby
  387  passenger-config about ruby-command
  388  cat /etc/apache2/mods-available/passenger.conf 
  389  whoami
  390  pwd
  391  cd ..
  392   ls -l
  393  ps -eaf | apache
  394  ps -eaf | grep apache
  395  clear
  396  cd ..
  397  cd apache/
  398  ls
  399  sudo cp app.conf /etc/apache2/sites-available
  400  sudo ln -s /etc/apache2/sites-available/app.conf /etc/apache2/sites-enabled/app.conf
  401  ls -l /etc/apache2/sites-available/
  402  ls -l /etc/apache2/sites-enabled/
  403  sudo systemctl restart apache2
  404  passenger-config about ruby-command
  405  cat /var/log/apache2/error.log 
  406  /home/ubuntu/.rvm/gems/ruby-2.6.3/wrappers/ruby
  407  cd curso/apache/
  408  sudo cp app.conf /etc/apache2/sites-available
  409  sudo systemctl restart apache2
  410  passenger-config about ruby-command
  411  redis-cli config get-databases
  412  redis-cli config get databases
  413  redis-cli set cat-count 10 OK
  414  sudo cp app.conf /etc/apache2/sites-available
  415  sudo systemctl restart apache2
  416  clear
  417  cd /etc/apache2
  418  ls sites-available/
  419  ls sites-enabled/
  420  clear
  421  cat /var/log/apache2/error.log 
  422  history
  423  passenger-config about ruby-command
  424  sudo cp app.conf /etc/apache2/sites-available
  425  cd ~/environment/curso/apache/
  426  sudo cp app.conf /etc/apache2/sites-available
  427  sudo systemctl restart apache2
  428  clear
  429  sudo passenger-status
  430  sudo passenger-memory-stats
  431  free
  432  netstat -lnt
  433  cd curso/desarrollo/redis/
  434  doscker-compose up
  435  docker-compose up
  436  docker-compose up -d
  437  netstat -lnt
  438  which ruby
  439  rvm list
  440  rvm 
  441  rvm list known
  442  rvm install 2.7.0
  443  which ruby
  444  rvm list
  445  rvm
  446  which ruby
  447  rvm use 2.6.3
  448  which ruby
  449  rvm use 2.7.0
  450  which ruby
  451  cd ..
  452  gem install rails
  453  which ruby
  454  rails
  455  clear
  456  rails new persona
  457  cd persona/
  458  bundle install
  459  rails g controller comer
  460  ps -eaf
  461  QUEUE=* rake resque:work
  462  ps -eaf
  463  ps -eaf
  464  QUEUE=* rake resque:work
  465  COUNT=4 QUEUE=* rake resque:work
  466  ps -eaf
  467  COUNT=4 QUEUE=* rake resque:workers
  468  cd curso/desarrollo/persona/
  469  QUEUE=* rake resque:work
  470  curl http://localhost:8080/comer/platano
  471  QUEUE=* rake resque:work
  472  ps -eaf 
  473  kill -9 17428
  474  rails s
  475  curl http://localhost:8080/comer/manzana
  476  curl http://localhost:8080/comer/tostada
  477  cd curso
  478  git add :/
  479  git commit -m 'app resque'
  480  git push
  481  git pull
  482  QUEUE=* rake resque:work
  483  rails s
  484  curl http://localhost:8080/comer/pepino
  485  rails s
  486  curl http://localhost:8080/comer/pepino
  487  curl -sb http://localhost:8080/comer/pepino
  488  rails s
  489  curl -sb http://localhost:8080/comer/pepino
  490  curl -b http://localhost:8080/comer/pepino
  491  curl http://localhost:8080/comer/pepino
  492  clear
  493  curl http://localhost:8080/comer/pepino
  494  clear
  495  rails s
  496  QUEUE=* rake resque:work
  497  ps -eaf
  498  clear
  499  clear
  500  clear
  501  clear
  502  rails g controller beber
  503  curl http://localhost:8080/comer/pepino
  504  curl http://localhost:8080/beber/martini
  505  rails s
  506  curl http://localhost:8080/beber/martini
  507  curl http://localhost:8080/comer/pepino
  508  curl http://localhost:8080/comer/pimiento
  509  curl http://localhost:8080/beber/caipirinha
  510  redis-cli -h localhost -p 6380
  511  clear
  512  COUNT=2 QUEUE=* rake resque:workers
  513  rails s
  514  clear
  515  curl ifconfig.me
  516  echo http://$(curl ifconfig.me):8080/jobs
  517  rails s
  518  bundle install
  519  rails s
  520  ps -eaf|grep puma
  521  rails s
  522  clear
  523  clear
  524  curl http://localhost:8080/comer/pimiento
  525  curl http://localhost:8080/comer/pepino
  526  curl http://localhost:8080/comer/tomate
  527  curl http://localhost:8080/comer/salmon
  528  curl http://localhost:8080/comer/zanahoria
  529  curl http://localhost:8080/beber/rioja
  530  curl http://localhost:8080/comer/martini
  531  curl http://localhost:8080/comer/ronmiel
  532  curl http://localhost:8080/comer/whisky
  533  curl http://localhost:8080/comer/pimiento
  534  curl http://localhost:8080/comer/pepino
  535  curl http://localhost:8080/comer/tomate
  536  curl http://localhost:8080/comer/salmon
  537  curl http://localhost:8080/comer/zanahoria
  538  curl http://localhost:8080/beber/rioja
  539  curl http://localhost:8080/comer/martini
  540  curl http://localhost:8080/comer/ronmiel
  541  curl http://localhost:8080/comer/whisky
  542  curl http://localhost:8080/comer/pimiento
  543  curl http://localhost:8080/comer/pepino
  544  curl http://localhost:8080/comer/tomate
  545  curl http://localhost:8080/comer/salmon
  546  curl http://localhost:8080/comer/zanahoria
  547  curl http://localhost:8080/beber/rioja
  548  curl http://localhost:8080/beber/martini
  549  curl http://localhost:8080/beber/ronmiel
  550  curl http://localhost:8080/beber/whisky
  551  curl http://localhost:8080/comer/pimiento
  552  curl http://localhost:8080/comer/pepino
  553  curl http://localhost:8080/comer/tomate
  554  curl http://localhost:8080/comer/salmon
  555  curl http://localhost:8080/comer/zanahoria
  556  curl http://localhost:8080/beber/rioja
  557  curl http://localhost:8080/beber/martini
  558  curl http://localhost:8080/beber/ronmiel
  559  curl http://localhost:8080/beber/whiskycurl http://localhost:8080/comer/pimiento
  560  curl http://localhost:8080/comer/pepino
  561  curl http://localhost:8080/comer/tomate
  562  curl http://localhost:8080/comer/salmon
  563  curl http://localhost:8080/comer/zanahoria
  564  curl http://localhost:8080/beber/rioja
  565  curl http://localhost:8080/beber/martini
  566  curl http://localhost:8080/beber/ronmiel
  567  curl http://localhost:8080/beber/whisky
  568  curl http://localhost:8080/comer/pimiento
  569  curl http://localhost:8080/comer/pepino
  570  curl http://localhost:8080/comer/tomate
  571  curl http://localhost:8080/comer/salmon
  572  curl http://localhost:8080/comer/zanahoria
  573  curl http://localhost:8080/beber/rioja
  574  curl http://localhost:8080/beber/martini
  575  curl http://localhost:8080/beber/ronmiel
  576  curl http://localhost:8080/beber/whiskycurl http://localhost:8080/comer/pimiento
  577  curl http://localhost:8080/comer/pepino
  578  curl http://localhost:8080/comer/tomate
  579  curl http://localhost:8080/comer/salmon
  580  curl http://localhost:8080/comer/zanahoria
  581  curl http://localhost:8080/beber/rioja
  582  curl http://localhost:8080/beber/martini
  583  curl http://localhost:8080/beber/ronmiel
  584  curl http://localhost:8080/beber/whisky
  585  curl http://localhost:8080/comer/pimiento
  586  curl http://localhost:8080/comer/pepino
  587  curl http://localhost:8080/comer/tomate
  588  curl http://localhost:8080/comer/salmon
  589  curl http://localhost:8080/comer/zanahoria
  590  curl http://localhost:8080/beber/rioja
  591  curl http://localhost:8080/beber/martini
  592  curl http://localhost:8080/beber/ronmiel
  593  curl http://localhost:8080/beber/whisky
  594  curl http://localhost:8080/comer/pimiento
  595  curl http://localhost:8080/comer/pepino
  596  curl http://localhost:8080/comer/tomate
  597  curl http://localhost:8080/comer/salmon
  598  curl http://localhost:8080/comer/zanahoria
  599  curl http://localhost:8080/beber/rioja
  600  curl http://localhost:8080/beber/martini
  601  curl http://localhost:8080/beber/ronmiel
  602  curl http://localhost:8080/beber/whisky
  603  curl http://localhost:8080/comer/pimiento
  604  curl http://localhost:8080/comer/pepino
  605  curl http://localhost:8080/comer/tomate
  606  curl http://localhost:8080/comer/salmon
  607  curl http://localhost:8080/comer/zanahoria
  608  curl http://localhost:8080/beber/rioja
  609  curl http://localhost:8080/beber/martini
  610  curl http://localhost:8080/beber/ronmiel
  611  curl http://localhost:8080/beber/whisky
  612  curl http://localhost:8080/comer/pimiento
  613  curl http://localhost:8080/comer/pepino
  614  curl http://localhost:8080/comer/tomate
  615  curl http://localhost:8080/comer/salmon
  616  curl http://localhost:8080/comer/zanahoria
  617  curl http://localhost:8080/beber/rioja
  618  curl http://localhost:8080/beber/martini
  619  curl http://localhost:8080/beber/ronmiel
  620  curl http://localhost:8080/beber/whisky
  621  curl http://localhost:8080/comer/pimiento
  622  curl http://localhost:8080/comer/pepino
  623  curl http://localhost:8080/comer/tomate
  624  curl http://localhost:8080/comer/salmon
  625  curl http://localhost:8080/comer/zanahoria
  626  curl http://localhost:8080/beber/rioja
  627  curl http://localhost:8080/beber/martini
  628  curl http://localhost:8080/beber/ronmiel
  629  curl http://localhost:8080/beber/whisky
  630  curl http://localhost:8080/comer/pimiento
  631  curl http://localhost:8080/comer/pepino
  632  curl http://localhost:8080/comer/tomate
  633  curl http://localhost:8080/comer/salmon
  634  curl http://localhost:8080/comer/zanahoria
  635  curl http://localhost:8080/beber/rioja
  636  curl http://localhost:8080/beber/martini
  637  curl http://localhost:8080/beber/ronmiel
  638  curl http://localhost:8080/beber/whisky
  639  curl http://localhost:8080/comer/pimiento
  640  curl http://localhost:8080/comer/pepino
  641  curl http://localhost:8080/comer/tomate
  642  curl http://localhost:8080/comer/salmon
  643  curl http://localhost:8080/comer/zanahoria
  644  curl http://localhost:8080/beber/rioja
  645  curl http://localhost:8080/beber/martini
  646  curl http://localhost:8080/beber/ronmiel
  647  curl http://localhost:8080/beber/whisky
  648  curl http://localhost:8080/comer/pimiento
  649  curl http://localhost:8080/comer/pepino
  650  curl http://localhost:8080/comer/tomate
  651  curl http://localhost:8080/comer/salmon
  652  curl http://localhost:8080/comer/zanahoria
  653  curl http://localhost:8080/beber/rioja
  654  curl http://localhost:8080/beber/martini
  655  curl http://localhost:8080/beber/ronmiel
  656  curl http://localhost:8080/beber/whisky
  657  curl http://localhost:8080/comer/pimiento
  658  curl http://localhost:8080/comer/pepino
  659  curl http://localhost:8080/comer/tomate
  660  curl http://localhost:8080/comer/salmon
  661  curl http://localhost:8080/comer/zanahoria
  662  curl http://localhost:8080/beber/rioja
  663  curl http://localhost:8080/beber/martini
  664  curl http://localhost:8080/beber/ronmiel
  665  curl http://localhost:8080/beber/whisky
  666  curl http://localhost:8080/comer/pimiento
  667  curl http://localhost:8080/comer/pepino
  668  curl http://localhost:8080/comer/tomate
  669  curl http://localhost:8080/comer/salmon
  670  curl http://localhost:8080/comer/zanahoria
  671  curl http://localhost:8080/beber/rioja
  672  curl http://localhost:8080/beber/martini
  673  curl http://localhost:8080/beber/ronmiel
  674  curl http://localhost:8080/beber/whisky
  675  curl http://localhost:8080/comer/pimiento
  676  curl http://localhost:8080/comer/pepino
  677  curl http://localhost:8080/comer/tomate
  678  curl http://localhost:8080/comer/salmon
  679  curl http://localhost:8080/comer/zanahoria
  680  curl http://localhost:8080/beber/rioja
  681  curl http://localhost:8080/beber/martini
  682  curl http://localhost:8080/beber/ronmiel
  683  curl http://localhost:8080/beber/whisky
  684  curl http://localhost:8080/comer/pimiento
  685  curl http://localhost:8080/comer/pepino
  686  curl http://localhost:8080/comer/tomate
  687  curl http://localhost:8080/comer/salmon
  688  curl http://localhost:8080/comer/zanahoria
  689  curl http://localhost:8080/beber/rioja
  690  curl http://localhost:8080/beber/martini
  691  curl http://localhost:8080/beber/ronmiel
  692  curl http://localhost:8080/beber/whisky
  693  curl http://localhost:8080/comer/pimiento
  694  curl http://localhost:8080/comer/pepino
  695  curl http://localhost:8080/comer/tomate
  696  curl http://localhost:8080/comer/salmon
  697  curl http://localhost:8080/comer/zanahoria
  698  curl http://localhost:8080/beber/rioja
  699  curl http://localhost:8080/beber/martini
  700  curl http://localhost:8080/beber/ronmiel
  701  curl http://localhost:8080/beber/whisky
  702  curl http://localhost:8080/comer/pimiento
  703  curl http://localhost:8080/comer/pepino
  704  curl http://localhost:8080/comer/tomate
  705  curl http://localhost:8080/comer/salmon
  706  curl http://localhost:8080/comer/zanahoria
  707  curl http://localhost:8080/beber/rioja
  708  curl http://localhost:8080/beber/martini
  709  curl http://localhost:8080/beber/ronmiel
  710  curl http://localhost:8080/beber/whisky
  711  curl http://localhost:8080/comer/pimiento
  712  curl http://localhost:8080/comer/pepino
  713  curl http://localhost:8080/comer/tomate
  714  curl http://localhost:8080/comer/salmon
  715  curl http://localhost:8080/comer/zanahoria
  716  curl http://localhost:8080/beber/rioja
  717  curl http://localhost:8080/beber/martini
  718  curl http://localhost:8080/beber/ronmiel
  719  curl http://localhost:8080/beber/whisky
  720  kill -9 19599
  721  ps -eaf
  722  ps -eaf | grep resque
  723  rails s
  724  COUNT=2 QUEUE=* rake resque:workers
  725  clear
  726  cd desarrollo/persona/
  727  cd ..
  728  cd..
  729  cd ..
  730  ls
  731  cd apache/
  732  ls
  733  sudo cp app2.conf /etc/apache2/sites-available
  734  sudo ln -s /etc/apache2/sites-available/app2.conf /etc/apache2/sites-enabled
  735  sudo systemctl restart apache2
  736  sudo cp app2.conf /etc/apache2/sites-available
  737  sudo ln -s /etc/apache2/sites-available/app2.conf /etc/apache2/sites-enabled
  738  sudo systemctl restart apache2
  739  cat /var/log/apache2/error.log 
  740  cur ifconfig.me
  741  curl ifconfig.me
  742  sudo cp app2.conf /etc/apache2/sites-available
  743  sudo systemctl restart apache2
  744  sudo rm /etc/apache2/sites-available/app.conf 
  745  sudo systemctl restart apache2
  746  cat /var/log/apache2/error.log 
  747  sudo cp app2.conf /etc/apache2/sites-available
  748  sudo systemctl restart apache2
  749  cat /var/log/apache2/error.log 
  750  cat /usr/bin/passenger-config
  751  gem install phusion_passenger
  752  which ruby
  753  rvm
  754  rvm use 2.7.0
  755  phusion_passenger
  756  gem install phusion_passenger
  757  sudo /usr/bin/passenger-config validate-install
  758  ls /home/ubuntu/.rvm/gems/ruby-2.7.0/wrappers/ruby
  759  ls  /home/ubuntu/environment/curso/desarrollo/persona/public
  760  sudo cp app2.conf /etc/apache2/sites-available
  761  sudo systemctl restart apache2
  762  sudo /usr/bin/passenger-config validate-install
  763  passenger-memory-stats
  764  sudo cp app2.conf /etc/apache2/sites-available
  765  sudo systemctl restart apache2
  766  sudo /usr/bin/passenger-config validate-install
  767  sudo passenger-status
  768    touch %RAILS_ROOT%/tmp/restart.txt
  769  sudo cp app2.conf /etc/apache2/sites-available
  770  sudo ln -s /etc/apache2/sites-available/app.conf /etc/apache2/sites-enabled
  771  ls /etc/apache2/sites-available/
  772  sudo cp app.conf /etc/apache2/sites-available
  773  sudo systemctl restart apache2
  774  journalctl -xe
  775  cat /var/log/apache2/error.log 
  776  sudo cp app2.conf /etc/apache2/sites-available
  777  sudo cp app.conf /etc/apache2/sites-available
  778  rm /var/log/apache2/error.log 
  779  sudo rm /var/log/apache2/error.log 
  780  sudo systemctl restart apache2
  781  sudo rm /var/log/apache2/error.log 
  782  journalctl -xe
  783  sudo cp app2.conf /etc/apache2/sites-available
  784  sudo cp app.conf /etc/apache2/sites-available
  785  sudo systemctl restart apache2
  786  sudo rm /var/log/apache2/error.log 
  787  sudo rm /var/log/apache2/error.log 
  788  sudo touch /var/log/apache2/error.log 
  789  sudo chmod 666 /var/log/apache2/error.log 
  790  cat /var/log/apache2/error.log 
  791  sudo systemctl restart apache2
  792  cat /var/log/apache2/error.log 
  793  dpkg -l | grep passenger
  794  /usr/bin/ruby -S passenger-config
  795  /usr/bin/ruby -S passenger-config about ruby-command
  796   passenger-config about ruby-command
  797  sudo  passenger-config about ruby-command
  798  /usr/bin/ruby -S passenger-config about ruby-command
  799  clear
  800  clear
  801  netstat -lnt
  802  hostname
  803  cd /home/ubuntu/environment/curso/redis/instalacionTradicional/
  804  sudo cp maestro.conf /etc/redis
  805  sudo systemctl restart redis_maestro_systemd.service 
  806  systemctl status redis_maestro_systemd.service 
  807  cat /var/log/redis_maestro.log 
  808  netstat -lnt
  809  ps -eaf | grep redis
  810  sudo kill -9 884
  811  sudo systemctl restart redis_maestro_systemd.service 
  812  ps -eaf | grep redis
  813  netstat -lnt
  814  cat /var/log/redis_maestro.log 
  815  cat /var/log/redis_centinela.log 
  816  cat /var/log/redis_centinela.log 
  817  cat /var/log/redis_centinela.log 
  818  cat /var/log/redis_centinela.log 
  819  cat /var/log/redis_centinela.log 
  820  cat /var/log/redis_centinela.log 
  821  cat /var/log/redis_centinela.log 
  822  cat /var/log/redis_centinela.log 
  823  cat /var/log/redis_centinela.log 
  824  cat /var/log/redis_centinela.log 
  825  cat /var/log/redis_centinela.log 
  826  cat /var/log/redis_centinela.log 
  827  cat /var/log/redis_centinela.log 
  828  cat /var/log/redis_centinela.log 
  829  cat /var/log/redis_centinela.log 
  830  cat /var/log/redis_centinela.log 
  831  cat /var/log/redis_centinela.log 
  832  cat /var/log/redis_centinela.log 
  833  cat /var/log/redis_centinela.log 
  834  cat /var/log/redis_centinela.log 
  835  cat /var/log/redis_centinela.log 
  836  redis-cli
  837  ps -eaf | grep redis
  838  sudo systemctl stop redis_maestro_systemd.service 
  839  ps -eaf | grep redis
  840  sudo systemctl start redis_maestro_systemd.service 
  841  ps -eaf | grep redis
  842  redis-cli -h localhost -p 6379
  843  sudo systemctl stop redis_centinela_systemd.service 
  844  sudo rm /var/log/redis_centinela.log 
  845  sudo systemctl stop redis_maestro_systemd.service 
  846  netstat -lnt
  847  sudo rm /var/log/redis_maestro.log 
  848  sudo systemctl start redis_maestro_systemd.service 
  849  cat /var/log/redis_maestro.log 
  850  redis-cli
  851  sudo systemctl start redis_centinela_systemd.service 
  852  cat /var/log/redis_centinela.log 
  853  cd ..
  854  cd ..
  855  cd desarrollo/
  856  cd persona/
  857  redis s
  858  curl localhost:8080/comer/platano
  859  rails s
  860  curl localhost:8080/comer/platano
  861  rails s
  862  curl localhost:8080/comer/platano
  863  rails s
  864  curl localhost:8080/comer/platano
  865  rails s
  866  curl localhost:8080/comer/platano
  867  rails s
  868  telnet 72.31.9.115 26379
  869  telnet 172.31.9.115 26379
  870  telnet 172.31.7.75 26379
  871  sudo cp ../../redis/instalacionTradicional/centinela.conf /etc/redis
  872  sudo systemctl restart redis_centinela_systemd.service 
  873  cd curso/desarrollo/persona/
  874  curl localhost:8080/comer/platano
  875  rails s
  876  curl localhost:8080/comer/platano
  877  rails s
  878  sudo cp ../../redis/instalacionTradicional/redis_centinela_systemd_2.service /etc/systemd/system
  879  sudo cp ../../redis/instalacionTradicional/redis_centinela_systemd_3.service /etc/systemd/system
  880  sudo cp ../../redis/instalacionTradicional/redis_centinela_systemd_2.service /etc/systemd/system
  881  sudo cp ../../redis/instalacionTradicional/redis_centinela_systemd_3.service /etc/systemd/system
  882  sudo cp ../../redis/instalacionTradicional/centinela.*.conf /etc/redis
  883  ls /etc/redis
  884  sudo systemctl start redis_centinela_systemd_2.service 
  885  sudo systemctl start redis_centinela_systemd_3.service 
  886  ps -eaf
  887  ps -eaf | grep redis
  888  sudo cp ../../redis/instalacionTradicional/centinela.*.conf /etc/redis
  889  sudo systemctl start redis_centinela_systemd_3.service 
  890  sudo systemctl restart redis_centinela_systemd_3.service 
  891  sudo systemctl restart redis_centinela_systemd_2.service 
  892  netstat -lnt
  893  systemctl status redis_centinela_systemd_2.service 
  894  cat /var/log/redis_centinela.log 
  895  curl localhost:8080/comer/platano
  896  rails s
  897  sudo cp ../../redis/instalacionTradicional/centinela.*.conf /etc/redis
  898  sudo cp ../../redis/instalacionTradicional/centinela.*.conf /etc/redis
  899  sudo systemctl restart redis_centinela_systemd_2.service 
  900  sudo systemctl restart redis_centinela_systemd_3.service 
  901  netstat -lnt 
  902  cat /var/log/redis_centinela.log 
  903  sudo systemctl status redis_centinela_systemd_2.service 
  904  sudo cp ../../redis/instalacionTradicional/redis_centinela_systemd_*.service /etc/systemd/system
  905  sudo systemctl daemon-reload 
  906  sudo systemctl restart redis_centinela_systemd_2.service 
  907  sudo systemctl restart redis_centinela_systemd_3.service 
  908  netstat -lnt 
  909  cat /var/log/redis_centinela_2.log 
  910  redis-cli
  911  curl localhost:8080/comer/platano
  912  rails s
  913  curl localhost:8080/comer/platano
  914  rails s
  915  curl localhost:8080/comer/platano
  916  rails s
  917  curl localhost:8080/comer/platano
  918  rails s
  919  sudo cp ../../redis/instalacionTradicional/centinela.*.conf /etc/redis
  920  sudo cp ../../redis/instalacionTradicional/centinela.conf /etc/redis
  921  sudo systemctl restart redis_centinela_systemd_2.service 
  922  sudo systemctl restart redis_centinela_systemd_3.service 
  923  sudo systemctl restart redis_centinela_systemd.service 
  924  cat /var/log/redis_centinela_2.log 
  925  curl localhost:8080/comer/platano
  926  curl localhost:8080/comer/platano
  927  rails s
  928  clear
  929  car /var/log/apache2/
  930  car /var/log/apache2/error.log 
  931  cat /var/log/apache2/error.log 
  932  clear
  933  cat /etc/apache2/mods-available/passenger.load 
  934  cat /etc/apache2/mods-available/passenger.load 
  935  cat /etc/apache2/mods-available/passenger.conf 
  936  which ruby
  937  sudo vim /etc/apache2/mods-available/passenger.conf 
  938  which ruby
  939  sudo vim /etc/apache2/mods-available/passenger.conf 
  940  sudo systemctl restart apache2
  941  cat /var/log/apache2/error.log 
  942  curl ifconfig.me
  943  sudo vim /etc/apache2/mods-available/passenger.conf 
  944  sudo vim /etc/apache2/mods-available/passenger.conf 
  945  sudo systemctl restart apache2
  946  passenger-config --ruby-command
  947  sudo passenger-config --ruby-command
  948  sudo /usr/sbin/passenger-memory-stats
  949  clear
  950  hostname
  951  cd curso/desarrollo/persona/
  952  curl http://localhost:8080/comer/platano
  953  redis-cli
  954  curl http://localhost:8080/comer/fresas
  955  redis-cli
  956  curl http://localhost:8080/comer/sandia
  957  rails s
  958  hostname
  959  cd curso/desarrollo/persona/
  960  curl localhost/comer/comida
  961  redis-cli
  962  curl ifconfig.me
  963  sudo su -
  964  sudo su -
  965  passenger-config about ruby-command
  966  which ruby
  967  rails s
  968  gem install passenger
  969  sudo systemctl restart apache2
  970  curl ifconfig.me
  971  clear
  972  clear
  973  curl localhost:8080/comer/madalena
  974  ps -eaf | grep redis
  975  sudo systemctl stop redis_maestro_systemd.service 
  976  curl localhost:8080/comer/madalena
  977  sudo systemctl start redis_maestro_systemd.service 
  978  rails s
  979  redis-cli -h 172.31.7.204
  980  redis-cli
  981  tail -f /var/log/redis_centinela_2.log 
  982  tail -f /var/log/redis_centinela.log 
  983  ps -eaf | grep puma
  984  clear
  985  sudo /usr/sbin/passenger-memory-stats
  986  sudo cp curso/apache/app2.conf /etc/apache2/sites-available
  987  sudo systemctl restart apache2
  988  systemctl status apache2.service
  989  sudo /usr/sbin/passenger-memory-stats
  990  sudo cp curso/apache/app2.conf /etc/apache2/sites-available
  991  sudo systemctl restart apache2
  992  sudo /usr/sbin/passenger-memory-stats
  993  curl localhost/comer/comida
  994  curl localhost/comer/comida
  995  curl localhost/comer/comida
  996  curl localhost/comer/comida
  997  curl localhost/comer/comida
  998  curl localhost/comer/comida
  999  curl localhost/comer/comida
 1000  curl localhost/comer/comida
 1001  curl localhost/comer/comida
 1002  curl localhost/comer/comida
 1003  curl localhost/comer/comida
 1004  curl localhost/comer/comida
 1005  sudo /usr/sbin/passenger-memory-stats
 1006  cd curso/
 1007  git add :/
 1008  git commit -m 'final'
 1009  history > comandos.sh
