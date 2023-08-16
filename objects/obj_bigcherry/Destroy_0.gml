if !in_baddieroom()
{
	var player = instance_place(x, y, obj_player);
	if thrown 
	{
		with instance_create(x, y, obj_canonexplosion)
			rat = true;
	}
	else if player
	{
		with instance_create(x, y, obj_gigacherrydead)
		{
			movespeed = abs(player.hithsp) + 4;
			if player.state != states.chainsaw
				movespeed = abs(player.hsp) + 4;
			image_xscale = player.xscale;
		}
	}
	else if place_meeting(x, y, obj_gigacherrydead)
	{
		var iceblock = instance_place(x, y, obj_gigacherrydead)
		with instance_create(x, y, obj_gigacherrydead)
		{
			movespeed = abs(iceblock.hsp) + 4
			image_xscale = iceblock.image_xscale
		}
	}
	else
	{
		with instance_create(x, y, obj_gigacherrydead) 
		{
			movespeed = 8
			image_xscale = -other.image_xscale
		}
	}
}
event_inherited();
