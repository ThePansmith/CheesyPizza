flags.do_once = false;
condition = function()
{
	return collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);
}
output = function()
{
	instance_deactivate_object(obj_verticalhallway);
}
