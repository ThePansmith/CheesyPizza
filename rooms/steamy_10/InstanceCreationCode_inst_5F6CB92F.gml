flags.do_once = false;
condition = function()
{
	with (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player1, false, false))
		return (state == states.cotton || state == states.cottonroll || state == states.cottondrill);
}

output = function()
{
	with (obj_text)
	{
		if (other.bbox_left <= x && other.bbox_right >= x && other.bbox_top <= y && other.bbox_bottom >= y)
			visible = true;
	}
	instance_destroy();
}