flags.do_once = false;

condition = function()
{
	return collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_player, false, true);
}
output = function()
{
	(instance_nearest(x, y, obj_cameraRegion)).Region_active = obj_player.state != states.Sjump;
}
