if (room == hub_loadingscreen && state != 2)
{
	with (obj_player)
	{
		state = states.comingoutdoor;
		sprite_index = spr_walkfront;
		image_index = 0;
	}
	if (!fadeoutcreate)
	{
		fadeoutcreate = true;
		with (obj_player)
		{
			ini_open_from_string(obj_savesystem.ini_str);
			var _intro = ini_read_real("Tutorial", "finished", false);
			
			character = ini_read_string("Game", "character", "P");
			scr_characterspr();
			if character == "G"
			{
				ratmount_movespeed = 8;
				gustavodash = 0;
				isgustavo = true;
				state = states.ratmount;
				sprite_index = spr_player_ratmountidle;
				brick = true;
			}
			
			paletteselect = ini_read_real("Game", "palette", character == "P" ? 1 : 0);
			var _texture = ini_read_string("Game", "palettetexture", "none");
			global.palettetexture = scr_get_texture_palette(_texture);
			ini_close();
			
			if (_intro or global.sandbox)
			{
				targetRoom = tower_entrancehall;
				targetDoor = "A";
				state = states.victory;
			}
			else
			{
				targetRoom = Finalintro;
				targetDoor = "A";
				state = states.titlescreen;
			}
			
			global.saveloaded = true;
		}
		with (instance_create(x, y, obj_fadeout))
		{
			gamestart = true;
			restarttimer = true;
		}
		icon_alpha = 0;
		with (obj_achievementtracker)
		{
			achievement_get_steam_achievements(achievements_update);
			achievement_get_steam_achievements(achievements_notify);
		}
		with (instance_create(0, 0, obj_loadingscreen))
		{
			dark = true;
			group_arr = ["hubgroup"];
			offload_arr = ["menugroup"];
		}
	}
}
if (state != 0)
{
	showicon = true;
	icon_alpha = 3;
}
else if (showicon)
{
	icon_alpha = Approach(icon_alpha, 0, 0.05);
	if (icon_alpha <= 0)
		showicon = false;
}
if (showicon)
{
	if SUGARY
		icon_index += .35;
	else
		icon_index = (icon_index + 0.35) % icon_max;
}
