y = -sprite_height;
down = true;
movespeed = 2;
depth = -100;
sound_play_oneshot("event:/sfx/misc/lap2start");

sugary = check_sugary();
if sugary
	sprite_index = spr_lap2_ss;
