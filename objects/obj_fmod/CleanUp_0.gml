if ds_exists(global.sound_map, ds_type_map)
	ds_map_destroy(global.sound_map);
if ds_exists(sound_cache, ds_type_map)
	ds_map_destroy(sound_cache);
if ds_exists(instance_cache, ds_type_list)
	ds_list_destroy(instance_cache);
