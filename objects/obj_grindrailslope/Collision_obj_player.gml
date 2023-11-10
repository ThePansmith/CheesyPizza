with other
	if !((state != states.tumble || (sprite_index != spr_tumble && sprite_index != spr_tumblestart && sprite_index != spr_tumbleend)) && state != states.backbreaker && state != states.chainsaw && state != states.bump)
		exit;

var slope_points = object_get_slope_line(id);
var obj = collision_line(slope_points[0], slope_points[1], slope_points[2], slope_points[3], obj_player, false, false);
	
if (obj == noone) || (obj.id != other.id)
	exit;
	
with other
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