if (instance_exists(obj_player))
{
	if (custom_level == 0)
	{
		if (room != obj_player1.targetRoom || roomreset)
		{
			scr_room_goto(obj_player1.targetRoom);
			with (obj_player)
			{
				if (state == states.ejected || state == states.policetaxi)
				{
					visible = true;
					state = states.normal;
				}
			}
		}
	}
}
