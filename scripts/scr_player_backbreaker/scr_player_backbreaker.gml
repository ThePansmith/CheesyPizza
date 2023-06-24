function scr_player_backbreaker()
{
	mach2 = 0;
	if (sprite_index != spr_player_machfreefall)
	{
		hsp = 0;
		movespeed = 0;
	}
	else
		hsp = xscale * movespeed;
	move = key_right2 + key_left2;
	if (parrytimer > 0)
		parrytimer--;
	else
		instance_destroy(parry_inst);
	landAnim = false;
	if (sprite_index == spr_player_machfreefall && place_meeting(x, y + 1, obj_solid))
	{
		state = states.machslide;
		sprite_index = spr_player_crouchslide;
	}
	if (sprite_index == spr_taunt or sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_player_ratmounttaunt or sprite_index == spr_player_ratmountsupertaunt)
	{
		if (supercharged == 1 && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_player_ratmountsupertaunt) && !instance_exists(obj_tauntaftereffectspawner))
		{
			if REMIX
				global.combotime = 60;
			instance_create(x, y, obj_tauntaftereffectspawner);
			var c = 0;
			var lag = 20;
			with (obj_baddie)
			{
				if (point_in_camera(x, y, view_camera[0]) && supertauntable)
				{
					global.style += (5 + floor(global.combo / 5));
					
					hp = -99;
					state = states.hit;
					hitLag = lag;
					hitX = x;
					hitY = y;
					if (elite)
					{
						elitehit = -1;
						mach3destroy = true;
					}
					if (destroyable)
						c++;
					instance_create(x, y, obj_parryeffect);
					alarm[3] = 3;
					repeat 3
					{
						create_slapstar(x, y);
						create_baddiegibs(x, y);
					}
					with (obj_camera)
					{
						shake_mag = 3;
						shake_mag_acc = 3 / room_speed;
					}
				}
			}
			with (obj_camera)
			{
				shake_mag = 10;
				shake_mag_acc = 30 / room_speed;
			}
			supercharge = 0;
			supercharged = false;
		}
		taunttimer--;
		vsp = 0;
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_supertaunt1 or sprite_index == spr_supertaunt2 or sprite_index == spr_supertaunt3 or sprite_index == spr_supertaunt4 or sprite_index == spr_player_supertaunt5 or sprite_index == spr_player_ratmountsupertaunt))
	{
		if (isgustavo)
			ratmount_movespeed = tauntstoredratmount_movespeed;
		movespeed = tauntstoredmovespeed;
		vsp = tauntstoredvsp;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
		supercharge = 0;
		supercharged = false;
		if (instance_exists(parry_inst))
		{
			instance_destroy(parry_inst);
			parry_inst = -4;
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers();
	}
	if ((sprite_index == spr_taunt or sprite_index == spr_player_ratmounttaunt) && taunttimer == 0)
	{
		if (isgustavo)
			ratmount_movespeed = tauntstoredratmount_movespeed;
		movespeed = tauntstoredmovespeed;
		vsp = tauntstoredvsp;
		sprite_index = tauntstoredsprite;
		state = tauntstoredstate;
		if (instance_exists(parry_inst))
		{
			instance_destroy(parry_inst);
			parry_inst = -4;
		}
		if (is_array(global.hasfarmer) && global.hasfarmer[farmerpos])
			scr_change_farmers();
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_eatspaghetti)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_throw)
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_Timesup or sprite_index == spr_ratmount_doorclosed) && place_meeting(x, y, obj_exitgate))
		state = states.normal;
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_levelcomplete or sprite_index == spr_playerN_victory))
		state = states.normal;
	if (key_jump && sprite_index == spr_player_phoneidle)
	{
		global.panic = true;
		sprite_index = spr_bossintro;
		image_index = 0;
		with (instance_create(x, y, obj_debris))
		{
			image_index = 0;
			sprite_index = spr_phonedebris;
		}
	}
	if (global.miniboss == 1 && sprite_index == spr_bossintro && floor(image_index) == (image_number - 1))
		state = states.normal;
	image_speed = 0.4;
	if (supercharged && key_up)
		scr_dotaunt();
}
