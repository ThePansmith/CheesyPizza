if (!in_baddieroom())
{
	create_particle(x, y, part.genericpoofeffect);
	ds_list_add(global.baddieroom, id);
}
