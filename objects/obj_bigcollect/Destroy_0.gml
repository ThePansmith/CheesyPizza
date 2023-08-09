if (!in_saveroom())
{
	add_saveroom();
	if (object_index == obj_escapecollectbig)
		ds_list_add(global.escaperoom, id);
}
if (visible)
	scr_ghostcollectible();
