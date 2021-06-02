/// @description Insert description here
// You can write your code in this editor
var type=async_load[?"type"]
if(type==network_type_data)
{
	var buff_read=async_load[?"buffer"]
	var primeira_leitura=buffer_read(buff_read,buffer_string)
	if(primeira_leitura=="id")
	{
		client_id=buffer_read(buff_read,buffer_s16)
	}
	else if(primeira_leitura=="movimento")
	{
		var numero_de_instancias=buffer_read(buff_read,buffer_s16)
		for(var i=0;i<numero_de_instancias;i++)
		{
			var objeto=buffer_read(buff_read,buffer_s16)
			if(objeto!=client_id)
			{
				/*
				show_debug_message(string(objeto)+"        "
				+string(buffer_read(buff_read,buffer_s16))+"        "+
				string(buffer_read(buff_read,buffer_s16)))
				*/
				var alterado= instancias[?objeto]
				if(alterado==undefined)
				{
					ds_map_add(instancias,objeto,instance_create_depth(buffer_read(buff_read,buffer_s16),
					buffer_read(buff_read,buffer_s16),
					0,obj_other_player))
				}
				else
				{
					alterado.x=buffer_read(buff_read,buffer_s16)
					alterado.y=buffer_read(buff_read,buffer_s16)
				}
				//alterado.x=buffer_read(buff_read,buffer_s16)
				//alterado.x=buffer_read(buff_read,buffer_s16)
			}
			else
			{
				buffer_read(buff_read,buffer_s16)
				buffer_read(buff_read,buffer_s16)
			}
		}
	}
	else if(primeira_leitura=="deletar_instancia")
	{
		var a_retirar = buffer_read(buff_read,buffer_s16)
		instance_destroy(instancias[? a_retirar])
		ds_map_delete(instancias,a_retirar)
	}
	
}