// RX: Support for multiple players because why not
var player_arr = array_create(0, noone);

var slope_points = object_get_slope_line(id, -1, -1, 1, 1);

with obj_player
{
	// RX: Are we even in bounds?
	if !rectangle_in_rectangle_fast(other.bbox_top - 2, other.bbox_left - 2, other.bbox_bottom + 2, other.bbox_right + 2, bbox_top, bbox_left, bbox_bottom, bbox_right)
		continue;
	
	var bbox_height = (bbox_bottom - bbox_top) + 2;
	
	var obj = noone;
	
	// loy this code controls when the play should become grind railed,
	// i don't know what states to avoid so you can jump
	// can you look at it for me?
	if !((state != states.tumble || (sprite_index != spr_tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend)) && state != states.backbreaker && state != states.chainsaw && state != states.bump)
		continue;
	if (state == states.ratmountjump && ((y <= yprevious && vsp < 0) || (y != yprevious)) // Don't cling while jumping or falling
		continue;
	var obj = collision_line(slope_points[0], slope_points[1], slope_points[2], slope_points[3], obj_player, false, false);
	
	if obj == noone || obj.id != id
		continue;

	array_push(player_arr, id);
}


if !array_length(player_arr)
	exit;

for (var i = 0; i < array_length(player_arr); i++)
{
	var player = player_arr[i];

	with (player)
	{
		var bbox_height = (bbox_bottom - bbox_top) + 2;
		if (!scr_transformationcheck())
			continue;

		while (inside_slope(obj_grindrailslope))
			y--;
		

		if !isgustavo
		{
			if movespeed < 10
				movespeed = 10;
			movespeed = clamp(movespeed, 0, 10);
			state = states.grind;	
		}
		else
		{
			if state != states.ratmountgrind
			{
				if (brick == 1)
				{
					with (instance_create(x, y, obj_brickcomeback))
						wait = true;
				}
				
				with (instance_create(x, y - 5, obj_parryeffect))
				{
					sound_play_3d("event:/sfx/pep/step", x, y);
					sprite_index = spr_grabhangeffect;
					image_speed = 0.35;
				}
				brick = false;
			}
			
			y += bbox_height;
			state = states.ratmountgrind;
		}
	}
}




