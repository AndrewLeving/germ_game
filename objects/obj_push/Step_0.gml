/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x+hsp,y,o_wall))
{
	while (!place_meeting(x+sign(hsp),y,o_wall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

vsp += fallsp;

if (place_meeting(x,y+vsp,o_wall))
{
	while (!place_meeting(x,y+sign(vsp),o_wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

if (place_meeting(x,y+vsp,obj_push))
{
	while (!place_meeting(x,y+sign(vsp),obj_push))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;