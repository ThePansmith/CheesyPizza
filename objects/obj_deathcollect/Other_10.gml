if image_alpha != 1
	exit;

global.heattime = 60;
global.combotime = 60;
sound_play(sfx_secretfound);
instance_destroy();
with obj_deathmode
    time_fx += 10;
create_collect(x, y, sprite_index);

add_saveroom();
