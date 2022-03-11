/// @description Insert description here

/// @description Insert description here

// Player input
key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) or keyboard_check(ord("W"));
key_quit = keyboard_check(vk_escape);
key_reset = keyboard_check(ord("R"));

//Calculate Size
image_xscale = scale;
image_yscale = scale;

var is_destroy = false;

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

if vsp < maxvsp
{
	vsp += fallsp;
}

if (place_meeting(x,y+5,o_wall)) && (key_jump)
{
	vsp = jumpheight;
}

// Horizontal collision
if (place_meeting(x+hsp,y,o_wall))
{
	while (!place_meeting(x+sign(hsp),y,o_wall))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

if (place_meeting(x,y+vsp,obj_push))
{
	while (!place_meeting(x+sign(hsp),y,obj_push))
	{
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Vertical collision
if (place_meeting(x,y+vsp,o_wall))
{
	if (vsp>=18)
	{
		instance_create_layer(xstart,ystart,"Walls",obj_small_player);
		is_destroy = true;
		instance_create_layer((other.x - 25),(other.y - 25),"Player",obj_corpse);	
	}
	while (!place_meeting(x,y+sign(vsp),o_wall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

if (place_meeting(x,y+vsp,obj_push))
{
	if (vsp>=18)
	{
		instance_create_layer(xstart,ystart,"Walls",obj_small_player);
		is_destroy = true;
		instance_create_layer((other.x - 25),(other.y - 25),"Player",obj_corpse);	
	}
	while (!place_meeting(x,y+sign(vsp),obj_push))
	{
		y += sign(vsp);
	}
	vsp = 0;
}

y += vsp;

if (place_meeting(x,y,obj_fire))
{
	burntime += 1;
}

if (burntime >= 15)
{
	instance_create_layer(xstart,ystart,"Walls",obj_fire_player);
	is_destroy = true;
}

if (is_destroy)
{
	instance_destroy()
}

if key_quit
{
	game_end();
}

if key_reset
{
	game_restart()
}