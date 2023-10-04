event_inherited();
var move_ver = key_down - key_up;
var move_hor = key_left + key_right;

switch(state)
{
	case paleditor_states.color_pick:
		color_pick_func(move_ver, move_hor);
		break;
}
prev_vert = move_ver;
