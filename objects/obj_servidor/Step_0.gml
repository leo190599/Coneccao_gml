/// @description Insert description here
// You can write your code in this editor
var buff=buffer_create(1,buffer_grow,1)
buffer_seek(buff,buffer_seek_start,0)
buffer_write(buff,buffer_string,"movimento")
buffer_write(buff,buffer_s16,ds_map_size(clientes))
for(var k=ds_map_find_first(clientes);k!=undefined;k=ds_map_find_next(clientes,k))
{
	//show_debug_message(string(clientes[? k].spd))
	buffer_write(buff,buffer_s16,clientes[? k].sock)
	buffer_write(buff,buffer_s16,clientes[? k].x)
	buffer_write(buff,buffer_s16,clientes[? k].y)
}
for(var k=ds_map_find_first(clientes);k!=undefined;k=ds_map_find_next(clientes,k))
{
	network_send_packet(clientes[? k].sock,buff,buffer_get_size(buff))
}