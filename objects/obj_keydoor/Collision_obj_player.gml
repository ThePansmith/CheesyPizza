var door = id;
var _actor = false;
with (obj_player)
{
	if (state == states.actor)
		_actor = true;
}
if (_actor)
	exit;
if (global.horse)
	exit;

if (!place_meeting(x, y, obj_doorblocked))
{
	with (other)
	{
		if (key_up && !instance_exists(obj_jumpscare) && grounded && (state == states.normal or state == states.ratmount or state == states.mach1 or state == states.mach2 or state == states.pogo or state == states.mach3 or state == states.Sjumpprep) && ((character != "M" && y == (other.y + 50)) or (character == "M" && y == (other.y + 55))) && !instance_exists(obj_noisesatellite) && !instance_exists(obj_fadeout) && state != states.door && state != states.comingoutdoor)
		{
			if other.sprite_index == spr_doorkeyopen
			{
				with obj_player
				{
					lastroom = room;
					targetDoor = door.targetDoor;
					targetRoom = door.targetRoom;
					
					/*
					if door.compatibility
					{
						oldHallway = true;
						player_x = door.target_x;
						player_y = door.target_y;
					}
					*/
				}
				sound_play("event:/sfx/misc/door");
				obj_camera.chargecamera = 0;
				ds_list_add(global.saveroom, id);
				sprite_index = spr_lookdoor;
				image_index = 0;
				state = states.door;
				mach2 = 0;
				
				if (instance_exists(obj_player2) && global.coop == 1)
				{
					if (object_index == obj_player2)
					{
						obj_player1.x = obj_player2.x;
						obj_player1.y = obj_player2.y;
					}
					if (object_index == obj_player1)
					{
						obj_player2.x = obj_player1.x;
						obj_player2.y = obj_player1.y;
					}
				}
				other.visited = true;
				instance_create(x, y, obj_fadeout);
			
				if REMIX
				{
					smoothx = x - (door.x + 50);
					x = door.x + 50;
				}
			}
			else if REMIX && key_up2 && !global.key_inv
			{
				sound_play_3d("event:/sfx/misc/keyunlock", x, y);
				instance_destroy(obj_keydoor_shake);
				instance_create(door.x + 50, door.y + 50, obj_keydoor_shake);
			}
		}
	}
}
