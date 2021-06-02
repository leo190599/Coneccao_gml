/// @description Insert description here
// You can write your code in this editor
var c_id=async_load[? "id"]
var c_type=async_load[? "type"]

if(c_type==network_type_connect)
{
	var socket=async_load[? "socket"]
	var novoPlayer=instance_create_depth(0,0,0,obj_player)
	novoPlayer.sock=socket
	ds_map_add(clientes,socket,novoPlayer)
	var buff_cliente=buffer_create(4,buffer_grow,1)
	buffer_write(buff_cliente,buffer_string,"id")
	buffer_write(buff_cliente,buffer_s16,socket)
	network_send_packet(socket,buff_cliente,buffer_get_size(buff_cliente))
}
else if(c_type == network_type_disconnect)
{
	var socket=async_load[? "socket"]
	instance_destroy(clientes[? socket])
	ds_map_delete(clientes,socket)
	var buff_cliente=buffer_create(4,buffer_grow,1)
	buffer_write(buff_cliente,buffer_string,"deletar_instancia")
	buffer_write(buff_cliente,buffer_s16,socket)
	for(var k=ds_map_find_first(clientes);k!=undefined;k=ds_map_find_next(clientes,k))
	{
		network_send_packet(clientes[? k].sock,buff_cliente,buffer_get_size(buff_cliente))
	}
}
else if(c_type==network_type_data)
{
	var socket=async_load[? "id"]
	var buff=async_load[? "buffer"]
	if(buffer_read(buff,buffer_string)=="movimentoPersonagem")
	{
		var b_player=clientes[? socket]
		b_player.x=buffer_read(buff,buffer_s32)
		b_player.y=buffer_read(buff,buffer_s32)
	}
}