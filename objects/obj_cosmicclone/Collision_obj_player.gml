if other.state == states.comingoutdoor || other.state == states.gottreasure || (other.state == states.firemouth && other.sprite_index == other.spr_firemouthintro)
or other.state == states.keyget or other.state == states.parry
{
	grace_period = 60;
	exit;
}

if (curr_state != noone && room == curr_state.room) && grace_period == 0 && visible 
{
	var par = instance_place(x, y, obj_parryhitbox);
	if par
	{
		with par
			event_user(0);
		grace_period = 60;
	}
	else
		scr_hurtplayer(other);
}
