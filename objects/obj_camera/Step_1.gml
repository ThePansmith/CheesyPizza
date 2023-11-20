/// @description camera regions
// from pto i mean sugary spire of course

live_auto_call;

if room == Mainmenu or room == rank_room or room == timesuproom
{
	limitcam = [0, 0, room_width, room_height];
	exit;
}

var camx = camera_get_view_x(view_camera[0]), camy = camera_get_view_y(view_camera[0]);
var camw = camera_get_view_width(view_camera[0]), camh = camera_get_view_height(view_camera[0]);

var targetcam = [0, 0, room_width, room_height];
var targetzoom = 1;
var targetangle = 0;

var _region = noone;
with obj_cameraRegion
{
	_region = id;
	if Region_active && activationCode()
	{
		if ClampRight
			targetcam[2] = x + sprite_width;
		if ClampBottom
			targetcam[3] = y + sprite_height;
		if ClampLeft
			targetcam[0] = x;
		if ClampTop
			targetcam[1] = y;
		
		targetzoom = zoom;
		targetangle = -image_angle;
		other.panspeed = panspeed;
	}
}

if smooth_buffer == 0
{
	limitcam = targetcam;
	camzoom = targetzoom;
	angle = targetangle;
	panspeed = 32;
}
else
{
	// LEFT
	if limitcam[0] < targetcam[0]
		limitcam[0] = min(camx, targetcam[0]);
	
	// TOP
	if limitcam[1] < targetcam[1]
		limitcam[1] = min(camy, targetcam[1]);
	
	// RIGHT
	if limitcam[2] > targetcam[2]
		limitcam[2] = max(camx + camw, targetcam[2]);
	
	// BOTTOM
	if limitcam[3] > targetcam[3]
		limitcam[3] = max(camy + camh, targetcam[3]);
	
	limitcam[0] = Approach(limitcam[0], targetcam[0], panspeed);
	limitcam[1] = Approach(limitcam[1], targetcam[1], panspeed);
	limitcam[2] = Approach(limitcam[2], targetcam[2], panspeed);
	limitcam[3] = Approach(limitcam[3], targetcam[3], panspeed);
	
	camzoom = lerp(camzoom, targetzoom, 0.25);
	angle = lerp(angle, targetangle, 0.25);
}
