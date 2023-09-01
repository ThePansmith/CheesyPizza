flags.do_once = false;
flags.do_save = false;

condition = function()
{
	return instance_place(x, y, obj_player);
}
output = function(player)
{
	/*
	if player.state != states.freefall && player.state != states.punch
	{
		player.y -= 934;
		with obj_camera
		{
			camy -= 934;
			event_perform(ev_step, 0);
		}
	}
	*/
}
