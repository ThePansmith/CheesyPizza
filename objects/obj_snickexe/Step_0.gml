x = Approach(x, obj_player1.x, maxspeed);
y = Approach(y, obj_player1.y, maxspeed);
if (x != obj_player1.x)
	image_xscale = -sign(x - obj_player1.x);

if (!global.snickchallenge && (global.laps < 2 or !(MOD.Lap3)))
or room == timesuproom or room == rank_room
	instance_destroy();
if (!hitboxcreate && (!obj_player1.instakillmove && obj_player1.state != states.handstandjump))
{
	hitboxcreate = true;
	with (instance_create(x, y, obj_forkhitbox))
	{
		sprite_index = other.sprite_index;
		ID = other.id;
	}
}
if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove || obj_player1.state == states.handstandjump))
or obj_player1.state == states.keyget
{
	if y > -50
	{
		repeat (6)
		{
			with (instance_create(x + irandom_range(-50, 50), y + irandom_range(-50, 50), obj_balloonpop))
				sprite_index = spr_shotgunimpact;
		}
	}
	reset_pos();
}

/*
if (room == ruin_11 || room == ruin_3)
{
	x = room_width / 2;
	y = -100;
}
*/
