if in_saveroom()
	instance_destroy();
if (global.snickchallenge == 1)
	instance_destroy(id, false);
if (room == tower_finalhallway)
	sprite_index = spr_protojohn;
if (room == exit_1)
	sprite_index = spr_protojohn;
