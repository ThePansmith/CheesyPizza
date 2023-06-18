if other.object_index == obj_spitcheesespike or other.object_index == obj_banditochicken_projectile or other.object_index == obj_robotknife
{
	with other
	{
		var current_hspd = abs(hsp);
		var _dir = sign(hsp);
		if x != other.x
			_dir = sign(x - other.x);
		hsp = _dir * current_hspd;
		image_xscale = _dir;
	}
}
if other.object_index == obj_forkhitbox
	obj_player.parryID = other.ID;
if REMIX && other.object_index == obj_pizzacutter2
{
	if instance_exists(other.handleID)
	{
		var dir = sign(lerp(bbox_left, bbox_right, 0.5) - obj_player1.x);
		if dir != 0
			other.handleID.spinspeed = abs(other.handleID.spinspeed) * dir;
	}
}

if !collisioned
{
	if obj_player1.x != other.x
		obj_player1.xscale = sign(other.x - obj_player1.x);
	else
		obj_player1.xscale = -other.image_xscale;
	event_user(0);
}
