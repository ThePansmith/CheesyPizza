live_auto_call;

depth = -100;

offset_by = function(by)
{		
	obj_player1.x += by;
	
	with obj_camera
	{
		camx += by - (camx_real - camx) / 2;
		event_perform(ev_step, 0);
		lock = true;
	}
	with obj_king
	{
		xstart += by;
		x += by;
	}
	with obj_parallax
	{
		var roombgs = room_get_bg_layers();
		for(var i = 0; i < array_length(roombgs); i++)
		{
			var l = roombgs[i];
			l.x += by % sprite_get_width(l.bg_sprite);
		}
		
		portal_offset.x -= by;
		//trace(portal_offset);
		event_perform(ev_step, ev_step_end);
	}
}

var point = 6784, cam_x = obj_player1.x - 960 / 2;
if cam_x > point + 32
	offset_by(-point);
if cam_x <= 32
	offset_by(point);

with obj_camera
	chargecamera = 0;
