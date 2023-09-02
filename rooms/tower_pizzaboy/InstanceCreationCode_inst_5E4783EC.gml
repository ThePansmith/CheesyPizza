condition = function()
{
	with obj_player
		return place_meeting(x, y, obj_startgate) && state == states.victory && image_index >= 10;
}
output = function()
{
	with obj_player
		state = states.normal;
	instance_destroy(obj_transfotip);
	instance_destroy(obj_startgate);
	
	global.leveltosave = noone;
	global.leveltorestart = noone;
	global.startgate = false;
}
