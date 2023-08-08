if (!in_saveroom())
{
	ds_list_add(global.saveroom, id);
	if (object_index == obj_escapecollectbig)
		ds_list_add(global.escaperoom, id);
}
if (visible)
	scr_ghostcollectible();
