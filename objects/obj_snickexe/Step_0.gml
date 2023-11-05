if (!global.snickchallenge && (global.laps < 2 or !MOD.Lap3))
or room == timesuproom or room == rank_room or MOD.EasyMode
{
	instance_destroy();
	exit;
}

if deactivate
{
	if hitboxcreate
	{
		with obj_forkhitbox
		{
			if ID == other.id
				instance_destroy();
		}
		
		with instance_create(x + irandom_range(-50, 50), y + irandom_range(-50, 50), obj_balloonpop)
			sprite_index = spr_shotgunimpact;
	}
	
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
		if target.state == states.parry && distance_to_object(target) < 50 && alarm[0] == -1 && !global.snickrematch
		{
			alarm[0] = 10;
			knocked = true;
			
			var dir = point_direction(x, y, target.x, target.y);
			hspeed = -lengthdir_x(16, dir);
			vspeed = -lengthdir_y(16, dir);
		}
	}
}
else if !global.snickrematch
{
	image_angle -= ((hspeed + vspeed) / 2) * 4;
	with instance_place(x, y, obj_baddie)
	{
		if object_index != obj_pizzaballOLD
			instance_destroy();
	}
}

if global.snickrematch
{
	sprite_index = spr_snick_rexe;
	with obj_player1
		if character == "S" other.sprite_index = spr_snick_exi;
	maxspeed = 2.75;
	
	if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
		maxspeed = 3.25;
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
or (obj_player1.state == states.keyget or obj_player1.state == states.victory or obj_player1.state == states.frozen) or place_meeting(x, y, obj_playerexplosion) or place_meeting(x, y, obj_dynamiteexplosion)
or safe_get(obj_pizzagoblinbomb, "state") == states.grabbed
&& !deactivate
	reset_pos();

// aftarimages
if --after <= 0
{
	after = 5;
	create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
}
