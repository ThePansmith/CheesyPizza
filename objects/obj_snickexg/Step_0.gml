if !(global.snickrematch && global.snickchallenge)
{
	instance_destroy(id, false);
	exit;
}

if deactivate
{
	x = room_width / 2;
	y = room_height + 100;
	
	hitboxcreate = false;
	visible = false;
	instance_destroy(obj_snickexgquill)
	
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

if hitboxcreate = false && (obj_player1.instakillmove = false && obj_player1.state != states.handstandjump && obj_player1.state != states.punch)
{
	hitboxcreate = true
	with instance_create(x,y,obj_forkhitbox)
	{
		sprite_index = other.sprite_index
		image_xscale = 0.5
		image_yscale = 0.5
		ID = other.id
	}
}

if (place_meeting(x, y, obj_player1) && (obj_player1.instakillmove || obj_player1.state == states.handstandjump))
or (obj_player1.state == states.keyget or obj_player.state == states.victory) or place_meeting(x, y, obj_playerexplosion) or place_meeting(x, y, obj_dynamiteexplosion)
or safe_get(obj_pizzagoblinbomb, "state") == states.grabbed
&& !deactivate
	reset_pos();

if room == dungeon_pizzamart
{
	x = room_width / 2
	y = room_height + 100
}
else
{
	for (var i = floor((x - 50) / 32) * 32; i < floor((x + 50) / 32) * 32; i += 32)
	{
		for (var j = floor((y - 50) / 32) * 32; j < floor((y + 50) / 32) * 32; j += 32)
		{
			if choose(true, false) && irandom_range(0, 10) == 10
			{
				var lay_id = layer_get_id("Tiles_1")
				var map_id = layer_tilemap_get_id(lay_id);
				
				var data = tilemap_get_at_pixel(map_id, i, j);
				if data > 0
				{
					data = irandom_range(1, 97);
					tilemap_set_at_pixel(map_id, data, i, j);
				}
			}
		}
	}
}

if quillt <= 0 && !knocked
{
	instance_create(x, y, obj_snickexgquill);
	quillt = room_speed / 2
}
else
	quillt -= 1
	
// aftarimages
if --after <= 0
{
	after = 5;
	create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
}
