**macvlan**: crea una red con `docker network create -d macvlan ... -o parent=eth0`.
Asigna contenedores a esa red para pruebas sobre la LAN física. Añade `cap_add: [NET_RAW, NET_ADMIN]`.
