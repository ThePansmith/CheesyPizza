if (ds_list_find_index(global.saveroom, id) != -1)
	instance_destroy();
if (global.snickchallenge == 1)
	instance_destroy(id, false);
if (room == tower_finalhallway)
	sprite_index = spr_protojohn;
if (room == exit_1)
	sprite_index = spr_protojohn;
