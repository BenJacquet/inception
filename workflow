
Verifier si l'upstream dans nginx.conf doit etre sur le port 443 ou 9000
aussi verifier si la directive upstream doit etre dans le nginx.conf ou dans conf.d


Setup WP et php
Setup Maria DB
Credentials dans un fichier .env
pas de login ou mdp contenant admin
Editer les identifiants dans wp-config pour qu'ils utilisent les valeurs de l'environnement

OK mettre en place un docker network
OK avoir mes master process en PID 1
OK modifier le hosts
OK nom de domaine jabenjam.42.fr qui redirige vers l'IP du conteneur nginx
OK Setup nginx avec TLS
OK Volume WP
OK Volume DB
OK Docker network
OK Redemarrage en cas de crash
OK REMPLACER LES VOLUMES PAR /home/user42/data

deployer TLS 1.3
https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/?__cf_chl_captcha_tk__=6d04d5c2be687f96e8c08a4ef3e916193abd3d8f-1621344181-0-AecNUdpQO8yzXIH00Niaoe7WQSrJFsuRakQV5tzIDPn2meJuSXcEeB7iY-c8vDNf82AtRnh_-x4VSQEfsb4uvMge28hRMCdfvM2Ey37Mj5AVu7jDplh5tgqzhPuAsLeI4-uX43WSsnwbu-46JmRx0YfSOBojaMskfFlpA2g8F48qGTJALmqjGj17t9m4CZHKxvIEGwLRRvbPjvJY6MxhXR3JBUVuyXV5bJ8oV-QKSQBPbK2i1onlrqol5lXQ9P9TwlqEI0ljUOqmAadITflv739vxcxHMYIUHyX1A2V5X003MxjLDYiQk8l8r0IMHFcFFCaZFHdaikODFv_pxemVlEXg5D_zbGf5Pw2_CgGrdCGAZ4IGobwHB7IcyDQpzXc4TiLtQuY67ge3iEKgaz14V9zAuuiK7Am1JuRfqvIi54Vsiq6B5gWE3hpMvxDebyDy8Ep8WSJrRAjAtEa19quD2cT41Tu9mTrWw_zOQE9ydHvkig7OLlzBiz1766bYlA7koBnj0zyICEk2Px291u4GkPelsINmjUYs7jZVgsYFsNBrHZ4QnX8fP0UDbVGF2AP2ltfQsq_zb4ay_mirwFNqyjbELMSU4TNP2PvxOBFByoXu1KUjiorP5KVfKmLzLHmqJrEZbr5HvuImSsJ3lGFwz2z_YYhqxglgb4Ans40aKPZ0ZVXUsV2YSqepvpjS8Be-IsEbppb_vx6WcYaca9-XC_RqVA5GeahytpMOkKOOxkz0

fastCGI et php-fpm avec un proxy :
https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx

$document_root = variable initialisee avec le chemin specifie dans l'instruction document_root
$request_method = methode http demandee pa le client
$fastcgi_script_name = initialisee avec l'URI demandee par le client

Wordpress :
https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-docker-compose
https://codereviewvideos.com/course/docker-tutorial-for-beginners/video/part-1-2-wordpress-and-nginx-with-docker-compose
https://codereviewvideos.com/course/docker-tutorial-for-beginners/video/docker-nginx-php-tutorial