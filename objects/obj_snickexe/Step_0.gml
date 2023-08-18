if (!global.snickchallenge && (global.laps < 2 or !(MOD.Lap3)))
or room == timesuproom or room == rank_room or MOD.NoSnick
{
	instance_destroy();
	exit;
}

if !knocked
{
	var target = instance_nearest(x, y, obj_player);
	if target
	{
		// follow player
		x = Approach(x, target.x, maxspeed);
		y = Approach(y, target.y, maxspeed);
		if x != target.x
			image_xscale = -sign(x - target.x);
	
		// parry
		if target.state == states.parry && distance_to_object(target) < 50 && alarm[0] == -1
		{
			alarm[0] = 10;
			knocked = true;
			
			var dir = point_direction(x, y, target.x, target.y);
			hspeed = -lengthdir_x(16, dir);
			vspeed = -lengthdir_y(16, dir);
		}
	}
}
else
{
	image_angle -= ((hspeed + vspeed) / 2) * 4;
	with instance_place(x, y, obj_baddie)
	{
		if object_index != obj_pizzaballOLD
			instance_destroy();
	}
}

// hurtbox
if (!hitboxcreate && (!obj_player1.instakillmove && obj_player1.state != states.handstandjump && obj_player.state != states.punch))
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		sprite_index = other.sprite_index;
		ID = other.id;
	}
}

// spontaneously evaporate if player is in cutscene
if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove || obj_player1.state == states.handstandjump))
or (obj_player1.state == states.keyget or obj_player.state == states.victory) or place_meeting(x, y, obj_playerexplosion) or place_meeting(x, y, obj_dynamiteexplosion)
	reset_pos();
