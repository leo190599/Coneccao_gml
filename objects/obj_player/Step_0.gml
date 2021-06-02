/// @description Insert description here
// You can write your code in this editor
if(instance_number(obj_cliente)>=1)
{
	if(keyboard_check(ord("A")))
	{
		x-=spd
	}
	else if(keyboard_check(ord("D")))
	{
		x+=spd
	}
	if(keyboard_check(ord("W")))
	{
		y-=spd
	}
	else if(keyboard_check(ord("S")))
	{
		y+=spd
	}
}