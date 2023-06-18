if (other.state == states.debugstate)
	exit;
if (other.state == states.backtohub)
	exit;
if (instance_exists(obj_jumpscare))
	exit;

var hall = id;
with (other)
{
	if (!other.savedposition)
	{
		other.savedposition = true;
		other.savedx = x;
		other.savedy = y;
	}
	x = other.savedx;
	y = other.savedy;
	if (!instance_exists(obj_fadeout))
	{
		lastroom = room;
		targetDoor = other.targetDoor;
		targetRoom = other.targetRoom;
		hallway = true;
		hallwaydirection = other.image_xscale;
		other.visited = true;
		fmod_event_one_shot("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
		
		if room == targetRoom
		{
			if other.sameroom
				xscale *= -1;
			obj_fadeout.roomreset = true;
		}
	}
}
