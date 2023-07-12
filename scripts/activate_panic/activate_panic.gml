function activate_panic()
{
	var instapanic = global.leveltosave == "grinch";
	if room == tower_finalhallway
		global.leveltosave = "exit";
	
	/*
	with obj_baddie
	{
		if escape
		{
			visible = true;
			create_particle(x, y, particle.genericpoofeffect);
		}
	}
	*/
	
	if !instapanic
	{
		fmod_event_instance_play(global.snd_escaperumble);
		fmod_event_instance_play(global.snd_johndead);
		
		instance_create_unique(0, 0, obj_hungrypillarflash);
		instance_create(0, 0, obj_itspizzatime);
		
		with obj_camera
		{
			alarm[1] = 60;
			shake_mag = 3;
			shake_mag_acc = 3 / room_speed;
		}
		notification_push(notifs.hungrypillar_dead, [room]);
	}
	
	global.fill = 4000;
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
		
		// cheesed up
		case strongcold_1:
			global.fill = 3240;
			break;
		case entryway_11:
			global.fill = 2500;
			break;
		case grinch_1:
			global.fill = 2148;
			break;
	}
	
	// if a hard modifier is on, extend timer a lot.
	if check_modifier(MOD.Pacifist) or check_modifier(MOD.NoToppings)
		global.fill *= 3;
	
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
	
	with obj_persistent
		event_user(1);
	
	global.panic = true;
}
function activate_snickchallenge()
{
	if !global.snickchallenge
	{
		global.fill = 7188; // 9:59
		// (((9 * 60) + 59) * 60) * 0.2
		
		if check_modifier(MOD.Pacifist) or check_modifier(MOD.NoToppings)
			global.fill *= 3;
		
		with obj_tv
		{
			chunkmax = global.fill;
			fill_lerp = global.fill;
		}
			
		global.wave = 0;
		global.maxwave = global.fill;
			
		global.snickchallenge = true;
		global.collect = 10000;
			
		with obj_camera
			alarm[1] = 60;
	}
	instance_create_unique(room_width / 2, -50, obj_snickexe);
}
