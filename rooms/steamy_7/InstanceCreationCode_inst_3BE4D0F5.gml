flags.do_save = false;
condition = function()
{
	var _check = false;
	with (obj_player1) {
		if place_meeting(roomstartx, roomstarty, other) {
			_check = true;
		}
	}
	return _check;
}

output = function() {
	obj_player1.state = states.slipbanan;
}
