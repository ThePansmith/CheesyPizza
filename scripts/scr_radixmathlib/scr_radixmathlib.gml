/// ==== LISTEN UP FUCK STICKS ====
/// I know this is going to be leaked eventually 
/// all of this code is copyright of RadixComet
/// Don't steal my fucking code
/// and if you are, at least fucking credit me.

function point_rotate(px, py, angle, cx, cy)
{
	var s = sin(angle);
	var c = cos(angle);
	
	var _ox = px - cx;
	var _oy = py - cy;
	
	var new_x = _ox * c - _oy * s;
	var new_y = _ox * s + _oy * c;
	
	return [new_x + cx, new_y + cy];
}