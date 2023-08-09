if (room == rm_editor)
	exit;
if (!in_saveroom())
{
	add_saveroom();
	if (object_index == obj_escapecollect)
		ds_list_add(global.escaperoom, id);
}
if (!gotowardsplayer)
	scr_ghostcollectible();
