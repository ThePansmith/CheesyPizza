flags.do_save = false;
condition = function() {
	var _check = false;
	with (obj_player) {
		if place_meeting(roomstartx, roomstarty, other) {
			_check = true;
		}
	}
	return _check;
}

output = function() {
	obj_player.state = states.slipbanan;
}