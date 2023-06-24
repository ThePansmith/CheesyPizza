var roomname = string_letters(room_get_name(room));
if place_meeting(x, y, obj_player)
{
	global.combotime = 60;
	fmod_event_one_shot(sugary ? "event:/modded/sfx/collecttoppinSP" : "event:/sfx/misc/collecttoppin");
	
	if (content == obj_noisebomb)
	{
		with (obj_player)
		{
			state = states.backbreaker;
			sprite_index = spr_player_bossintro;
			image_index = 0;
		}
		with (instance_create(x, y - 25, content))
			sprite_index = spr_noisebomb_intro;
		instance_create(x, y, obj_taunteffect);
		instance_create(x, y + 600, obj_itspizzatime);
		global.panic = true;
		switch (room)
		{
			case floor2_roomtreasure:
				global.minutes = 2;
				global.seconds = 40;
				break;
			case floor3_roomtreasure:
				global.minutes = 2;
				global.seconds = 30;
				break;
			case floor4_roomtreasure:
				global.minutes = 2;
				global.seconds = 0;
				break;
			case floor5_roomtreasure:
				global.minutes = 2;
				global.seconds = 0;
				break;
		}
		global.wave = 0;
		global.maxwave = ((global.minutes * 60) + global.seconds) * 60;
		if (global.panicbg)
			scr_panicbg_init();
	}
	if object_is_ancestor(content, obj_pizzakinparent)
	{
		with instance_create(x, y, obj_smallnumber)
			number = "1000";
		if (place_meeting(x, y, obj_player1))
			global.collect += 1000;
		else
			global.collectN += 1000;
		instance_create(x, y, obj_taunteffect);
		with instance_create(x, y - 25, content)
		{
			if roomname == "strongcold"
				sprite_index = spr_intro_strongcold;
			else
				sprite_index = spr_intro;
		}
		global.toppintotal += 1;
		
		switch content
		{
			case obj_pizzakinshroom: global.shroomfollow = true; break;
			case obj_pizzakincheese: global.cheesefollow = true; break;
			case obj_pizzakintomato: global.tomatofollow = true; break;
			case obj_pizzakinsausage: global.sausagefollow = true; break;
			case obj_pizzakinpineapple: global.pineapplefollow = true; break;
		}
		
		if REMIX or sugary
		{
			var text = $"\{u}You have found {global.toppintotal} {sugary ? "Confecti" : (global.toppintotal == 1 ? "Toppin" : "Toppins")} out of 5!";
			create_transformation_tip(text);
		}
	}
	if (content == obj_noisey)
	{
		fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y);
		with (instance_create(x, y - 25, content))
		{
			image_xscale = other.image_xscale;
			state = states.stun;
			stunned = 20;
			vsp = -5;
		}
	}
	instance_destroy();
}
subimg += 0.35;
if (subimg > (sprite_get_number(spr_toppinhelp) - 1))
{
	subimg = frac(subimg);
	scr_fmod_soundeffect(snd, x, y);
}
