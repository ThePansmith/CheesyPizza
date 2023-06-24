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
		targetDoor = hall.targetDoor;
		targetRoom = hall.targetRoom;
		hallway = true;
		hallwaydirection = hall.image_xscale;
		
		if hall.compatibility
		{
			oldHallway = true;
			player_x = hall.target_x;
			player_y = hall.target_y;
		}
		
		hall.visited = true;
		fmod_event_one_shot("event:/sfx/misc/door");
		with (instance_create(x, y, obj_fadeout))
		{
			offload_arr = hall.offload_arr;
			group_arr = hall.group_arr;
		}
		
		if room == targetRoom
		{
			if hall.sameroom
				xscale *= -1;
			obj_fadeout.roomreset = true;
		}
	}
}
