scr_destroy_tiles(32, "Tiles_1");
scr_destroy_tiles(32, "Tiles_2");
if (!in_saveroom())
	ds_list_add(global.saveroom, id);
