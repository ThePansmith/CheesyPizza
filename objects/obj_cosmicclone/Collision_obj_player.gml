if obj_player1.state == states.comingoutdoor || obj_player1.state == states.gottreasure || (obj_player1.state == states.firemouth && obj_player1.sprite_index == obj_player1.spr_firemouthintro)
{
	grace_period = 60;
	exit;
}

if (curr_state != noone && room == curr_state.room) && grace_period == 0 && visible
	scr_hurtplayer(other);
	