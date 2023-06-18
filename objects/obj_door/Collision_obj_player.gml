if locked
	exit;

var _actor = false;
var door = id;
with obj_player
{
	if state == states.actor
		_actor = true;
}
if _actor
	exit;
if global.horse
	exit;
if john && global.panic
	exit;

if !place_meeting(x, y, obj_doorblocked)
{
	with other
	{
		if key_up && !instance_exists(obj_jumpscare) && grounded && (((state == states.ratmount or state == states.ratmountbounce) && brick) or state == states.normal or state == states.mach1 or state == states.mach2 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep) && y == (other.y + 50) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor
		{
			if room == tower_5
			{
				backtohubroom = room;
				backtohubstartx = x;
				backtohubstarty = y;
			}
			sound_play("event:/sfx/misc/door");
			obj_camera.chargecamera = 0;
			ds_list_add(global.saveroom, id);
			
			if isgustavo
				sprite_index = spr_ratmount_enterdoor;
			else
				sprite_index = obj_player1.spr_lookdoor;
			
			if REMIX
			{
				smoothx = x - (door.x + door.sprite_width / 2);
				x = door.x + door.sprite_width / 2;
			}
			
			with obj_player
			{
				lastroom = room;
				targetDoor = door.targetDoor;
				targetRoom = door.targetRoom;
				
				image_index = 0;
				if state != states.gotoplayer
					state = states.door;
				mach2 = 0;
				
				/*
				if door.compatibility
				{
					oldHallway = true;
					player_x = door.target_x;
					player_y = door.target_y;
				}
				*/
			}
			if instance_exists(obj_player2) && global.coop
			{
				if object_index == obj_player2
				{
					obj_player1.x = obj_player2.x;
					obj_player1.y = obj_player2.y;
				}
				if object_index == obj_player1
				{
					obj_player2.x = obj_player1.x;
					obj_player2.y = obj_player1.y;
				}
			}
			with obj_player2
			{
				if instance_exists(obj_coopplayerfollow)
					state = states.gotoplayer;
			}
			other.visited = true;
			if ds_list_find_index(global.saveroom, other.id) == -1
				ds_list_add(global.saveroom, other.id);
			with instance_create(x, y, obj_fadeout)
			{
				offload_arr = door.offload_arr;
				group_arr = door.group_arr;
			}
		}
	}
}
