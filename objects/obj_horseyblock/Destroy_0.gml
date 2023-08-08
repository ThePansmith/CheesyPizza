if (!in_saveroom())
{
	create_particle(x, y, part.genericpoofeffect);
	ds_list_add(global.saveroom, id);
}
