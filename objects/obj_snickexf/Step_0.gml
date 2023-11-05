if !(global.snickrematch && global.snickchallenge)
{
	instance_destroy(id, false)
	exit
}

if deactivate
{
	x = room_width / 2;
	y = -100;
	
	hitboxcreate = false;
	visible = false;
	
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

if !hitboxcreate && (!obj_player.instakillmove && obj_player1.state != states.handstandjump)
{
	hitboxcreate = true
	with instance_create(x, y, obj_forkhitbox)
	{
		sprite_index = other.sprite_index
		ID = other.id
	}
}

if obj_player1.state == states.keyget or obj_player1.state == states.victory
{
	deactivate = true;
	alarm[1] = room_speed * 5;
}

if room == ruin_11 or room == ruin_4 or room == medieval_pizzamart or room == ruin_pizzamart or room == dungeon_pizzamart
{
	x = room_width / 2
	y = -100
}

// powers
else if !point_in_rectangle(x, y, CAMX - 50, CAMY - 50, CAMX + CAMW + 50, CAMY + CAMH + 50) && cantp <= 0
{
	var target = instance_nearest(x, y, obj_player1);
	if target
	{
		y = target.y;
		x = clamp(target.x + 900 * -target.xscale, CAMX, CAMX + CAMW);
	}
	
	repeat 6 with instance_create(x + random_range(-100, 100), y + random_range(-100, 100), obj_balloonpop)
		sprite_index = spr_shotgunimpact;
	
	cantp = room_speed * 3;
}

// teleport cooldown (it's still unfair as shit)
if cantp > 0
{
	cantp -= 1;
	if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
		cantp -= 4;
}
else
	cantp = 0;

// aftarimages
if --after <= 0
{
	after = 5;
	create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
}
