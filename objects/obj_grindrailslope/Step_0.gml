// RX: Support for multiple players because why not
var player_arr = array_create(0, noone);

with obj_player
{
	if y < yprevious
		continue;
	if !rectangle_in_rectangle_fast(other.bbox_top, other.bbox_left, other.bbox_bottom, other.bbox_right, bbox_top, bbox_left, bbox_bottom, bbox_right)
		continue;

	var arr = object_get_slope_triangle(other.id);
	
	if !rectangle_in_triangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
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
		if (!scr_transformationcheck())
			exit;
		while (inside_slope(obj_grindrailslope))
			y--;
			
		movespeed = clamp(movespeed, 0, 10);
		state = states.grind;
	}

	/* if ((player.y > player.yprevious || (player.xscale == sign(image_xscale) && player.y < bbox_bottom)) && player.state != states.backbreaker && player.state != states.bump)
	{
		with (player)
		{
			if (!scr_transformationcheck())
				exit;
			while (inside_slope(obj_grindrailslope))
				y--;
		}
		if (!player.isgustavo)
		{
			if (player.movespeed < 10)
				player.movespeed = 10;
			player.state = states.grind;
		}
		else
		{
			player.y = y + 8;
			player.state = states.ratmountgrind;
		}
	}*/

}




