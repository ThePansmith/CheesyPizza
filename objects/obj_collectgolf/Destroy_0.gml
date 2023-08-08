if (room == rm_editor)
	exit;
if (!in_saveroom())
	ds_list_add(global.saveroom, id);
scr_ghostcollectible();
