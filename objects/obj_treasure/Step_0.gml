if (instance_place(x, y, obj_glassblock))
	exit;

var _p = player == 2 ? obj_player2 : obj_player1;
switch state
{
	case 0:
		if (got && _p.state != states.gottreasure)
		{
			if escape
			{
				stop_music();
				instance_destroy(effectid);
				visible = false;
				state = 1;
				
				with _p
				{
					state = states.actor;
					sprite_index = isgustavo ? spr_ratmount_doorclosed : spr_Timesup;
					image_index = 0;
					image_speed = 0.35;
				}
			}
			else
				instance_destroy();
		}

		if (player == 0)
			y = Wave(ystart - 5, ystart + 5, 2, 2);
		if (player == 0 && place_meeting(x, y, obj_player))
		{
			var num = instance_place_list(x, y, obj_player, global.instancelist, false);
			for(var i = 0; i < num; i++)
			{
				var _player = ds_list_find_value(global.instancelist, i);
				with (_player)
				{
					if (state != states.gotoplayer)
					{
						treasure_x = x;
						treasure_y = y;
						treasure_room = room;
						ds_list_add(global.saveroom, other.id);
						global.treasure = true;
						hsp = 0;
						vsp = 0;
						if (!other.got)
						{
							other.alarm[0] = 150;
							state = states.gottreasure;
							sound_play("event:/sfx/misc/foundtreasure");
						}
						other.got = true;
						other.x = x - 18;
						other.y = y - 35;
						other.effectid = instance_create(other.x + 18, other.y, obj_treasureeffect);
						other.vsp = 0;
						other.depth = -20;
						obj_tv.showtext = true;
						obj_tv.message = "YOU GOT A TOWER SECRET TREASURE!!!";
						obj_tv.alarm[0] = 200;
						other.player = (object_index == obj_player1) ? 1 : 2;
						ds_list_clear(global.instancelist);
						if REMIX
							global.combotime = 60;
						break;
					}
				}
			}
			ds_list_clear(global.instancelist);
		}
		break;
	
	case 1:
		if _p.image_index >= _p.image_number - 1
		{
			with _p
			{
				tauntstoredstate = isgustavo ? states.ratmount : states.normal;
				state = states.animation;
				sprite_index = spr_bossintro;
				image_index = 0;
			}
			state = 2;
		}
		break;
	
	case 2:
		activate_panic();
		instance_destroy(id, false);
		break;
}
