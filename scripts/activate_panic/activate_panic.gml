function activate_panic()
{
	if room == tower_finalhallway
		global.leveltosave = "exit";
	
	/*
	with obj_baddie
	{
		if escape
		{
			visible = true;
			instance_create(x, y, obj_genericpoofeffect);
		}
	}
	*/
	fmod_event_instance_play(global.snd_johndead);
	
	global.fill = 4000;
	notification_push(notifs.hungrypillar_dead, [room]);
	
	switch room
	{
		case entrance_10:
			global.fill = 1860;
			break;
		case medieval_10:
			global.fill = 2040;
			break;
		case ruin_11:
			global.fill = 2040;
			break;
		case dungeon_10:
			global.fill = 2460;
			break;
		case badland_9:
			global.fill = 2556;
			break;
		case graveyard_6:
			global.fill = 2640;
			break;
		case farm_11:
			global.fill = 1920;
			break;
		case saloon_6:
			global.fill = 2100;
			break;
		case plage_cavern2:
			global.fill = 2220;
			break;
		case forest_john:
			global.fill = 2520;
			break;
		case space_9:
			global.fill = 2220;
			break;
		case minigolf_8:
			global.fill = 3240;
			break;
		case street_john:
			global.fill = 2280;
			break;
		case sewer_8:
			global.fill = 3300;
			var lay = layer_get_id("Backgrounds_scroll");
			layer_set_visible(lay, true);
			break;
		case industrial_5:
			global.fill = 2760;
			break;
		case freezer_escape1:
			global.fill = 2640;
			break;
		case chateau_9:
			lay = layer_get_id("Backgrounds_stillH1");
			layer_background_sprite(layer_background_get_id(lay), spr_chateaudarkbg_escape);
			global.fill = 2520;
			break;
		case kidsparty_john:
			global.fill = 2460;
			break;
		case tower_finalhallway:
			global.fill = 4056;
			break;
		case strongcold_1:
			global.fill = 3240;
			break;
	}
	instance_create_unique(0, 0, obj_hungrypillarflash);
	
	with obj_tv
	{
		chunkmax = global.fill;
		fill_lerp = global.fill;
	}
	with obj_escapecollect
	{
		gotowardsplayer = false;
		movespeed = 5;
		image_alpha = 1;
	}
	with obj_escapecollectbig
		image_alpha = 1;
	
	global.wave = 0;
	global.maxwave = global.fill;
	//if global.panicbg
	//	scr_panicbg_init();
	
	fmod_event_instance_play(global.snd_escaperumble);
	obj_camera.alarm[1] = 60;
	
	with obj_camera
	{
		shake_mag = 3;
		shake_mag_acc = 3 / room_speed;
	}
	
	instance_create(x, y + 600, obj_itspizzatime);
	global.panic = true;
	
	/*
	switch room // how do you fuck this up
	{
		case entrance_10:
			global.minutes = 2;
			global.seconds = 30;
			break;
		case medieval_10:
			global.minutes = 2;
			global.seconds = 15;
			break;
		case ruin_11:
			global.minutes = 2;
			global.seconds = 59;
			break;
		case dungeon_10:
			global.minutes = 4;
			global.seconds = 30;
			break;
		case chateau_6:
			global.minutes = 3;
			global.seconds = 15;
			break;
		case strongcold_1:
			global.minutes = 4;
			global.seconds = 0;
			break;
		case dragonlair_1:
			global.minutes = 0;
			global.seconds = 59;
			break;
		case desert_16:
			global.minutes = 2;
			global.seconds = 30;
			break;
		case graveyard_6:
			global.minutes = 3;
			global.seconds = 59;
			break;
		case farm_11:
			global.minutes = 3;
			global.seconds = 59;
			break;
		case pinball_17:
			global.minutes = 3;
			global.seconds = 12;
			break;
		case beach_13:
			global.minutes = 3;
			global.seconds = 30;
			break;
		case forest_5:
			global.minutes = 3;
			global.seconds = 30;
			break;
		case minigolf_8:
			global.minutes = 7;
			global.seconds = 30;
			break;
		case space_9:
			global.minutes = 5;
			global.seconds = 30;
			break;
		case sewer_8:
			global.minutes = 5;
			global.seconds = 30;
			break;
		case city_11:
			global.minutes = 5;
			global.seconds = 30;
			break;
		case mansion_7:
			global.minutes = 5;
			global.seconds = 30;
			break;
		case factory_10:
			global.minutes = 6;
			global.seconds = 30;
			break;
		case freezer_3:
			global.minutes = 5;
			global.seconds = 30;
			break;
		case war_1:
			global.minutes = 6;
			global.seconds = 30;
			break;
		case exit_1:
			global.minutes = 9;
			global.seconds = 59;
			break;
		case kidsparty_lastroom:
			global.minutes = 3;
			global.seconds = 30;
			break;
		case custom_lvl_room:
			global.minutes = 2;
			global.seconds = 15;
			break;
		default:
			global.minutes = 5;
			global.seconds = 30;
			break;
	}
	*/
}
