/// @description Insert description here
// You can write your code in this editor
show_debug_message("servidor")
servidor=network_create_server(network_socket_tcp,8080,2)
clientes=ds_map_create()