//live_auto_call;

if !instance_exists(playerid) or playerid.hat < 0
{
	instance_destroy();
	exit;
}

xoffset = 0//lerp(xoffset, lerp(sprite_get_bbox_left(playerid.sprite_index), sprite_get_bbox_right(playerid.sprite_index), 0.5) - playerid.sprite_xoffset, 0.25);
yoffset = lerp(yoffset, sprite_get_bbox_top(playerid.sprite_index) - 50, 0.5);

image_index = playerid.hat;
x = playerid.x + xoffset + playerid.smoothx;
y = playerid.y + yoffset + abs(sin(scr_current_time() / 200) * 4);
image_xscale = playerid.xscale;

if instance_exists(obj_rank) or instance_exists(obj_timesup) or (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter) or (instance_exists(obj_lapportal) && obj_lapportal.sprite_index == obj_lapportal.spr_enter)
or (instance_exists(obj_lapportalentrance) && obj_lapportalentrance.sprite_index == obj_lapportalentrance.spr_spit)
	visible = false;
else
	visible = true;
