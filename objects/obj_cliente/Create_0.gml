/// @description Insert description here
// You can write your code in this editor
cliente=network_create_socket(network_socket_tcp)

Retorno=network_connect(cliente,"127.0.0.1",8080)

buff=buffer_create(256,buffer_grow,1)

player=instance_create_depth(0,0,0,obj_player)

instancias=ds_map_create()

client_id=0