init_collision();
grav = 0;
image_speed = 0;
alarm[0] = 40;
global.panic = false;
alarm[1] = 600;

ini_open_from_string(obj_savesystem.ini_str);
ini_write_real("Attempts", global.leveltosave, ini_read_real("Attempts", global.leveltosave, 0) + global.levelattempts + 1);
obj_savesystem.ini_str = ini_close();
gamesave_async_save();

global.levelattempts = 0;
global.combo = 0;
global.comboscore = 0;

instance_destroy(obj_comboend);
instance_destroy(obj_snickexe);
if REMIX
	instance_destroy(obj_lap2visual);

if global.modifier_failed or MOD.DeathMode
	sprite_index = spr_modfailed;
buffer = 30;

snd = fmod_event_create_instance("event:/music/timesup");
fmod_event_instance_play(snd);
