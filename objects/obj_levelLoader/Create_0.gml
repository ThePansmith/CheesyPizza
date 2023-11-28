with obj_levelLoader
{
	if id != other.id
		instance_destroy();
}

// init
objects = cyop_objectlist();
_room = noone;
room_name = "";
room_ind = -1;

global.custom_sprites = ds_map_create();
global.custom_tiles = ds_map_create();
global.custom_audio = ds_map_create();
global.room_map = ds_map_create();
global.asset_cache = ds_map_create();
global.cyop_broken_tiles = ds_list_create();

loaded = false;
gamestart = false;
tile_surface = noone;
cam_x = -1;
cam_y = -1;
