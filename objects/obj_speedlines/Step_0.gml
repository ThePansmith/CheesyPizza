x = playerid.x;
y = playerid.y;
image_xscale = playerid.xscale;
if (abs(playerid.hsp) <= 0 || ((playerid.state != states.mach3 || abs(playerid.movespeed) <= 12) && (playerid.character != "S" or abs(playerid.hsp < 12))) || (playerid.collision_flags & colflag.secret) > 0 || playerid.cutscene || room == timesuproom)
	instance_destroy();
if (room == timesuproom)
	instance_destroy();
