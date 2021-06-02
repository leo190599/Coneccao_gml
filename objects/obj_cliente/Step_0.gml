/// @description Insert description here
// You can write your code in this editor
buffer_seek(buff,buffer_seek_start,0)

buffer_write(buff,buffer_string,"movimentoPersonagem")
buffer_write(buff,buffer_s32,player.x)
buffer_write(buff,buffer_s32,player.y)

network_send_packet(cliente,buff,buffer_get_size(buff))