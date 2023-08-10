// init
objects = cyop_objectlist();
_room = noone;
room_name = "";
room_ind = -1;

global.custom_sprites = ds_map_create();
global.custom_tiles = ds_map_create();
global.room_map = ds_map_create();
global.asset_cache = ds_map_create();

// load level
loaded = false;
event_user(0);
if !loaded
	instance_destroy();
