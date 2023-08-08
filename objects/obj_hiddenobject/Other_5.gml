ds_list_destroy(deactivatedlist);
if (activated && !in_saveroom())
	ds_list_add(global.saveroom, id);
